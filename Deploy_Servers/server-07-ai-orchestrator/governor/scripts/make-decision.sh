#!/usr/bin/env bash
set -euo pipefail

OUTPUT="/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"

PROJECT_DIR="/opt/africamapping/tenants"

TOTAL_PROJECTS=0
ACTIVE_PROJECTS=0

for TENANT in "$PROJECT_DIR"/*; do
  [ -d "$TENANT" ] || continue

  FLOW_DIR="$TENANT/flows/flow-03"

  for FILE in "$FLOW_DIR"/*-processed.txt; do
    [ -f "$FILE" ] || continue

    TOTAL_PROJECTS=$((TOTAL_PROJECTS+1))

    STATUS=$(grep '^status=' "$FILE" | tail -n 1 | cut -d '=' -f2)

    if [ "$STATUS" = "active" ]; then
      ACTIVE_PROJECTS=$((ACTIVE_PROJECTS+1))
    fi
  done
done

# Decision logic
if [ "$TOTAL_PROJECTS" -eq 0 ]; then
  DECISION="WARNING: No projects detected. System idle."
elif [ "$ACTIVE_PROJECTS" -eq 0 ]; then
  DECISION="CAUTION: No active work. Projects may be stalled or prematurely completed."
else
  DECISION="APPROVED: Active work detected. System operating normally."
fi

mkdir -p "$(dirname "$OUTPUT")"

cat <<EOF > "$OUTPUT"
# Governor Decision

Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')

## Decision

$DECISION

## Metrics

Total Projects: $TOTAL_PROJECTS  
Active Projects: $ACTIVE_PROJECTS  

## Governor Interpretation

System evaluated based on real lifecycle state.
EOF

echo "[governor] decision written to $OUTPUT"
