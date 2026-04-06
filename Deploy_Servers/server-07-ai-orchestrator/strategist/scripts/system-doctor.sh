#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
DASHBOARD_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"

REPORT="$OUTPUT_DIR/system-doctor-report.md"
JSON_REPORT="$DASHBOARD_DIR/system-doctor.json"

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

########################################
# PLATFORM CHECK
########################################

STATE_FILE="$BASE/deployment-state/constellation-status.json"

if [ -f "$STATE_FILE" ]; then
  add_pass "Deployment state exists"
  HEARTBEAT=$(grep -o '"heartbeat_state": *"[^"]*"' "$STATE_FILE" | cut -d '"' -f4 || true)
  FIRST_DEPLOY=$(grep -o '"first_deploy": *[^,]*' "$STATE_FILE" | awk -F': ' '{print $2}' | tr -d ' ' || true)

  if [ "${HEARTBEAT:-unknown}" = "steady" ]; then
    add_pass "Heartbeat steady"
  else
    add_warning "Heartbeat not steady (${HEARTBEAT:-unknown})"
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

########################################
# DASHBOARD CHECKS
########################################

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

check_dashboard "$DASHBOARD_DIR/latest-dashboard.json" "Shared dashboard"
check_dashboard "$DASHBOARD_DIR/realestate-ai-dashboard.json" "Tenant dashboard"
check_dashboard "$DASHBOARD_DIR/customers/customer-001-dashboard.json" "Customer dashboard"
check_dashboard "$DASHBOARD_DIR/employees/employee-001-dashboard.json" "Employee dashboard"

########################################
# GOVERNANCE CHECK
########################################

DECISION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
VALIDATION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
INFRA_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard/latest-dashboard.json"

if [ -f "$DECISION_FILE" ] && grep -q "APPROVED" "$DECISION_FILE"; then
  add_pass "Governor approved system"
else
  add_warning "Governor approval missing"
  add_recommendation "Inspect governor decision logic and latest decision file."
fi

if [ -f "$VALIDATION_FILE" ] && grep -q "RESULT=PASS" "$VALIDATION_FILE"; then
  add_pass "Relationship validation passed"
else
  add_warning "Relationship validation not passing"
  add_recommendation "Inspect tenant program/project linkage and validation script."
fi

if [ -f "$INFRA_FILE" ] && grep -q '"restart_required": true' "$INFRA_FILE"; then
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
