#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
DASHBOARD_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"

REPORT="$OUTPUT_DIR/system-doctor-report.md"
JSON_REPORT="$DASHBOARD_DIR/system-doctor.json"

STATE_FILE="$BASE/deployment-state/constellation-status.json"
SETTLED_STATE_FILE="$BASE/deployment-state/constellation-status-settled.json"

NARRATOR_SUMMARY="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
SHARED_DASHBOARD="$DASHBOARD_DIR/latest-dashboard.json"
TENANT_DASHBOARD="$DASHBOARD_DIR/realestate-ai-dashboard.json"
CUSTOMER_DASHBOARD="$DASHBOARD_DIR/customers/customer-001-dashboard.json"
EMPLOYEE_DASHBOARD="$DASHBOARD_DIR/employees/employee-001-dashboard.json"

DECISION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
VALIDATION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
COMPARISON_REPORT="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-comparison.md"
GOV_HEALTH_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/latest-health.md"

mkdir -p "$OUTPUT_DIR"
mkdir -p "$DASHBOARD_DIR"

STATUS="OK"
FAIL_COUNT=0
WARN_COUNT=0

FAILURES=""
WARNINGS=""
PASSES=""
RECOMMENDATIONS=""

add_pass() {
  PASSES="${PASSES}- PASS: $1\n"
}

add_warning() {
  WARN_COUNT=$((WARN_COUNT + 1))
  WARNINGS="${WARNINGS}- WARNING: $1\n"
  if [ "$STATUS" = "OK" ]; then
    STATUS="WARNING"
  fi
}

add_fail() {
  FAIL_COUNT=$((FAIL_COUNT + 1))
  FAILURES="${FAILURES}- FAIL: $1\n"
  STATUS="CRITICAL"
}

add_recommendation() {
  RECOMMENDATIONS="${RECOMMENDATIONS}- $1\n"
}

extract_heartbeat() {
  local file="$1"
  if [ -f "$file" ]; then
    grep -o '"heartbeat_state": *"[^"]*"' "$file" | head -n 1 | cut -d '"' -f4 || true
  fi
}

check_dashboard() {
  local path="$1"
  local label="$2"

  if [ -f "$path" ]; then
    if [ -s "$path" ]; then
      add_pass "$label present"
    else
      add_warning "$label exists but is empty"
      add_recommendation "Regenerate $label and inspect its generator script."
    fi
  else
    add_fail "$label missing"
    add_recommendation "Check dashboard generation step for $label."
  fi
}

dashboard_uses_global_ids() {
  local file="$1"
  local key="$2"

  [ -f "$file" ] || return 1

  python3 - "$file" "$key" <<'PY'
import json
import sys

path = sys.argv[1]
key = sys.argv[2]

try:
    with open(path) as f:
        data = json.load(f)
except Exception:
    sys.exit(1)

items = data.get(key, [])
if not isinstance(items, list) or not items:
    sys.exit(1)

for item in items:
    value = item.get("id", "")
    if ":" not in value:
        sys.exit(1)

sys.exit(0)
PY
}

########################################
# PLATFORM CHECKS
########################################

STATE_HEARTBEAT="unknown"
SETTLED_HEARTBEAT="unknown"
SHARED_DASHBOARD_HEARTBEAT="unknown"
TENANT_DASHBOARD_HEARTBEAT="unknown"
NARRATOR_HEARTBEAT="unknown"

if [ -f "$STATE_FILE" ]; then
  add_pass "Deployment state exists"
  STATE_HEARTBEAT="$(extract_heartbeat "$STATE_FILE")"

  FIRST_DEPLOY=$(grep -o '"first_deploy": *[^,]*' "$STATE_FILE" | awk -F': ' '{print $2}' | tr -d ' ' || true)

  if [ "${STATE_HEARTBEAT:-unknown}" = "steady" ]; then
    add_pass "Heartbeat steady"
  else
    add_warning "Heartbeat not steady (${STATE_HEARTBEAT:-unknown})"
    add_recommendation "Rerun deployment and inspect deployment-state generation logic."
  fi

  if [ "${FIRST_DEPLOY:-false}" = "true" ]; then
    add_warning "System still reports first_deploy=true"
    add_recommendation "Inspect deployment-state persistence and initialization logic."
  else
    add_pass "System no longer in first-deploy mode"
  fi
else
  add_fail "Deployment state missing"
  add_recommendation "Recreate deployment-state directory and rerun deploy."
fi

if [ -f "$SETTLED_STATE_FILE" ]; then
  add_pass "Settled deployment state exists"
  SETTLED_HEARTBEAT="$(extract_heartbeat "$SETTLED_STATE_FILE")"

  if [ "${SETTLED_HEARTBEAT:-unknown}" = "steady" ]; then
    add_pass "Settled heartbeat steady"
  else
    add_fail "Settled heartbeat not steady"
    add_recommendation "Inspect settled deployment-state write order and final heartbeat logic."
  fi
else
  add_fail "Settled deployment state missing"
  add_recommendation "Inspect settled deployment-state generation in deploy pipeline."
fi

########################################
# FLOW-01 CHECK
########################################

if [ -f "$BASE/flows/flow-01/event.txt" ] && [ -f "$BASE/flows/flow-01/processed.txt" ]; then
  add_pass "Flow-01 event and processed artifacts present"
else
  add_fail "Flow-01 artifacts missing"
  add_recommendation "Check bastion/app flow-01 scripts and runtime path creation."
fi

########################################
# TENANT CHECKS
########################################

TENANTS_DIR="$BASE/tenants"

for TENANT in "$TENANTS_DIR"/*; do
  [ -d "$TENANT" ] || continue

  NAME=$(basename "$TENANT")
  FLOW03="$TENANT/flows/flow-03"
  FLOW04="$TENANT/flows/flow-04"

  PROJECT_COUNT=$(find "$FLOW03" -maxdepth 1 -type f -name '*-processed.txt' 2>/dev/null | wc -l | tr -d ' ')
  PROGRAM_COUNT=$(find "$FLOW04" -maxdepth 1 -type f -name '*-processed.txt' 2>/dev/null | wc -l | tr -d ' ')

  if [ "${PROJECT_COUNT:-0}" -gt 0 ]; then
    add_pass "Tenant $NAME has processed projects ($PROJECT_COUNT)"
  else
    add_warning "Tenant $NAME has no processed projects"
    add_recommendation "Inspect flow-03 intake and project processor for tenant $NAME."
  fi

  if [ "${PROGRAM_COUNT:-0}" -gt 0 ]; then
    add_pass "Tenant $NAME has processed programs ($PROGRAM_COUNT)"
  else
    add_warning "Tenant $NAME has no processed programs"
    add_recommendation "Inspect flow-04 intake and program processor for tenant $NAME."
  fi
done

DUPLICATE_PROJECT_IDS=$(find "$BASE/tenants" -path '*/flows/flow-03/*-processed.txt' -type f -printf '%f\n' 2>/dev/null | sort | uniq -d || true)
if [ -n "$DUPLICATE_PROJECT_IDS" ]; then
  add_warning "Duplicate processed project IDs exist across tenants"
  add_recommendation "Consider tenant-qualified IDs if cross-tenant reporting will expand."
else
  add_pass "No duplicate processed project IDs across tenants"
fi

########################################
# DASHBOARD CHECKS
########################################

check_dashboard "$SHARED_DASHBOARD" "Shared dashboard"
check_dashboard "$TENANT_DASHBOARD" "Tenant dashboard"
check_dashboard "$CUSTOMER_DASHBOARD" "Customer dashboard"
check_dashboard "$EMPLOYEE_DASHBOARD" "Employee dashboard"

if dashboard_uses_global_ids "$SHARED_DASHBOARD" "projects"; then
  add_pass "Shared dashboard uses tenant-qualified global project IDs"
else
  add_warning "Shared dashboard does not use tenant-qualified global project IDs"
  add_recommendation "Inspect shared dashboard project ID generation."
fi

if dashboard_uses_global_ids "$SHARED_DASHBOARD" "programs"; then
  add_pass "Shared dashboard uses tenant-qualified global program IDs"
else
  add_warning "Shared dashboard does not use tenant-qualified global program IDs"
  add_recommendation "Inspect shared dashboard program ID generation."
fi

SHARED_DASHBOARD_HEARTBEAT="$(extract_heartbeat "$SHARED_DASHBOARD")"
TENANT_DASHBOARD_HEARTBEAT="$(extract_heartbeat "$TENANT_DASHBOARD")"
NARRATOR_HEARTBEAT="$(extract_heartbeat "$NARRATOR_SUMMARY")"

if [ -f "$NARRATOR_SUMMARY" ]; then
  add_pass "Narrator summary present"
else
  add_fail "Narrator summary missing"
  add_recommendation "Inspect narrator summary generation order in deploy pipeline."
fi

if [ -n "${SETTLED_HEARTBEAT:-}" ] && [ "${SHARED_DASHBOARD_HEARTBEAT:-unknown}" = "${SETTLED_HEARTBEAT:-unknown}" ]; then
  add_pass "Shared dashboard heartbeat matches settled state"
else
  add_fail "Shared dashboard heartbeat does not match settled state"
  add_recommendation "Inspect shared dashboard generator state-source selection."
fi

if [ -n "${SETTLED_HEARTBEAT:-}" ] && [ "${TENANT_DASHBOARD_HEARTBEAT:-unknown}" = "${SETTLED_HEARTBEAT:-unknown}" ]; then
  add_pass "Tenant dashboard heartbeat matches settled state"
else
  add_fail "Tenant dashboard heartbeat does not match settled state"
  add_recommendation "Inspect tenant dashboard generator state-source selection."
fi

if [ -n "${SETTLED_HEARTBEAT:-}" ] && [ "${NARRATOR_HEARTBEAT:-unknown}" = "${SETTLED_HEARTBEAT:-unknown}" ]; then
  add_pass "Narrator heartbeat matches settled state"
else
  add_fail "Narrator heartbeat does not match settled state"
  add_recommendation "Inspect narrator summary sequencing and settled-state read preference."
fi

########################################
# GOVERNANCE CHECKS
########################################

if [ -f "$DECISION_FILE" ] && grep -q "APPROVED: Active work detected. System operating normally." "$DECISION_FILE"; then
  add_pass "Governor approved system"
else
  add_fail "Governor approval missing"
  add_recommendation "Inspect governor decision logic and latest decision file."
fi

if [ -f "$VALIDATION_FILE" ] && grep -q "RESULT=PASS" "$VALIDATION_FILE"; then
  add_pass "Relationship validation passed"
else
  add_warning "Relationship validation not passing"
  add_recommendation "Inspect tenant program/project linkage and validation script."
fi

if [ -f "$COMPARISON_REPORT" ] && grep -q "The deployment matched expected runtime artifacts." "$COMPARISON_REPORT"; then
  add_pass "Preview versus actual comparison passed"
else
  add_fail "Preview versus actual comparison did not pass"
  add_recommendation "Inspect deploy ordering and expected runtime artifact generation."
fi

if [ -f "$GOV_HEALTH_FILE" ] && grep -q "Governance Loop health is healthy." "$GOV_HEALTH_FILE"; then
  add_pass "Governance Loop health is healthy"
else
  add_fail "Governance Loop health is not healthy"
  add_recommendation "Inspect governance-loop report ordering and dependency files."
fi

if [ -f "$SHARED_DASHBOARD" ] && grep -q '"restart_required": true' "$SHARED_DASHBOARD"; then
  add_warning "Infrastructure restart required"
  add_recommendation "Schedule safe reboot window if appropriate."
else
  add_pass "No restart required"
fi

########################################
# WRITE MARKDOWN REPORT
########################################

{
  echo "# System Doctor Report"
  echo ""
  echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
  echo ""
  echo "## Overall Status"
  echo ""
  echo "- Status: $STATUS"
  echo "- Failures: $FAIL_COUNT"
  echo "- Warnings: $WARN_COUNT"
  echo ""
  echo "## Passes"
  echo ""
  printf "%b" "$PASSES"
  echo ""
  echo "## Warnings"
  echo ""
  if [ -n "$WARNINGS" ]; then
    printf "%b" "$WARNINGS"
  else
    echo "- None"
  fi
  echo ""
  echo "## Failures"
  echo ""
  if [ -n "$FAILURES" ]; then
    printf "%b" "$FAILURES"
  else
    echo "- None"
  fi
  echo ""
  echo "## Recommended Actions"
  echo ""
  if [ -n "$RECOMMENDATIONS" ]; then
    printf "%b" "$RECOMMENDATIONS"
  else
    echo "- No action required."
  fi
} > "$REPORT"

########################################
# WRITE JSON REPORT
########################################

cat > "$JSON_REPORT" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "status": "$STATUS",
  "failures": $FAIL_COUNT,
  "warnings": $WARN_COUNT
}
EOFJSON

cat "$REPORT"
