#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
REPORT="$OUTPUT_DIR/system-doctor-report.md"

mkdir -p "$OUTPUT_DIR"

echo "# System Doctor Report" > "$REPORT"
echo "" >> "$REPORT"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$REPORT"
echo "" >> "$REPORT"

########################################
# PLATFORM CHECK
########################################

echo "## Platform Health" >> "$REPORT"
echo "" >> "$REPORT"

STATE_FILE="$BASE/deployment-state/constellation-status.json"

if [ -f "$STATE_FILE" ]; then
  echo "- PASS: Deployment state exists" >> "$REPORT"

  HEARTBEAT=$(grep -o '"heartbeat_state": *"[^"]*"' "$STATE_FILE" | cut -d '"' -f4 || true)

  if [ "$HEARTBEAT" = "steady" ]; then
    echo "- PASS: Heartbeat steady" >> "$REPORT"
  else
    echo "- WARNING: Heartbeat not steady ($HEARTBEAT)" >> "$REPORT"
  fi
else
  echo "- FAIL: Deployment state missing" >> "$REPORT"
fi

echo "" >> "$REPORT"

########################################
# FLOW-01 CHECK
########################################

echo "## Flow-01 (Core Event Flow)" >> "$REPORT"
echo "" >> "$REPORT"

if [ -f "$BASE/flows/flow-01/event.txt" ] && [ -f "$BASE/flows/flow-01/processed.txt" ]; then
  echo "- PASS: Flow-01 event + processed present" >> "$REPORT"
else
  echo "- FAIL: Flow-01 missing artifacts" >> "$REPORT"
fi

echo "" >> "$REPORT"

########################################
# TENANT CHECKS
########################################

echo "## Tenant Health" >> "$REPORT"
echo "" >> "$REPORT"

TENANTS_DIR="$BASE/tenants"

for TENANT in "$TENANTS_DIR"/*; do
  [ -d "$TENANT" ] || continue

  NAME=$(basename "$TENANT")

  echo "### Tenant: $NAME" >> "$REPORT"
  echo "" >> "$REPORT"

  FLOW03="$TENANT/flows/flow-03"
  FLOW04="$TENANT/flows/flow-04"

  PROJECT_COUNT=$(find "$FLOW03" -name '*processed.txt' 2>/dev/null | wc -l || true)
  PROGRAM_COUNT=$(find "$FLOW04" -name '*processed.txt' 2>/dev/null | wc -l || true)

  if [ "$PROJECT_COUNT" -gt 0 ]; then
    echo "- PASS: Projects processed ($PROJECT_COUNT)" >> "$REPORT"
  else
    echo "- WARNING: No processed projects" >> "$REPORT"
  fi

  if [ "$PROGRAM_COUNT" -gt 0 ]; then
    echo "- PASS: Programs processed ($PROGRAM_COUNT)" >> "$REPORT"
  else
    echo "- WARNING: No processed programs" >> "$REPORT"
  fi

  echo "" >> "$REPORT"
done

########################################
# DASHBOARD CHECKS
########################################

echo "## Dashboard Health" >> "$REPORT"
echo "" >> "$REPORT"

DASHBOARD_BASE="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"

check_file () {
  if [ -f "$1" ]; then
    echo "- PASS: $2" >> "$REPORT"
  else
    echo "- FAIL: $2 missing" >> "$REPORT"
  fi
}

check_file "$DASHBOARD_BASE/latest-dashboard.json" "Shared dashboard"
check_file "$DASHBOARD_BASE/realestate-ai-dashboard.json" "Tenant dashboard"
check_file "$DASHBOARD_BASE/customers/customer-001-dashboard.json" "Customer dashboard"
check_file "$DASHBOARD_BASE/employees/employee-001-dashboard.json" "Employee dashboard"

echo "" >> "$REPORT"

########################################
# GOVERNANCE CHECK
########################################

echo "## Governance Health" >> "$REPORT"
echo "" >> "$REPORT"

DECISION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"

if grep -q "APPROVED" "$DECISION_FILE"; then
  echo "- PASS: Governor approved system" >> "$REPORT"
else
  echo "- WARNING: Governor did not approve system" >> "$REPORT"
fi

echo "" >> "$REPORT"

########################################
# FINAL SUMMARY
########################################

echo "## System Doctor Interpretation" >> "$REPORT"
echo "" >> "$REPORT"
echo "The system has been evaluated across platform, flows, tenants, dashboards, and governance." >> "$REPORT"
echo "Any FAIL conditions should be treated as critical issues requiring immediate attention." >> "$REPORT"

cat "$REPORT"
