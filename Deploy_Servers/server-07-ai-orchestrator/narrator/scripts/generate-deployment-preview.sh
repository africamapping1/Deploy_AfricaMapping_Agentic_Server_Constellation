#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
RECORDS_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/records"
PREVIEW_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/previews"
PREVIEW_FILE="$PREVIEW_DIR/latest-deployment-preview.md"

mkdir -p "$PREVIEW_DIR"

echo "# Deployment Preview" > "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"

echo "## Reason Records Considered" >> "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"
for file in \
  "$RECORDS_DIR/record-001-heartbeat.md" \
  "$RECORDS_DIR/record-002-flow-01.md" \
  "$RECORDS_DIR/record-003-narrator.md"
do
  if [ -f "$file" ]; then
    echo "- $(basename "$file")" >> "$PREVIEW_FILE"
  else
    echo "- MISSING: $(basename "$file")" >> "$PREVIEW_FILE"
  fi
done

echo "" >> "$PREVIEW_FILE"
echo "## Expected Deployment Effects" >> "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"
echo "- heartbeat state will be updated" >> "$PREVIEW_FILE"
echo "- narrator reason records will be checked" >> "$PREVIEW_FILE"
echo "- governed flow-01 will run" >> "$PREVIEW_FILE"
echo "- bastion should create an event" >> "$PREVIEW_FILE"
echo "- app should process the event" >> "$PREVIEW_FILE"
echo "- monitoring should write flow output" >> "$PREVIEW_FILE"
echo "- narrator should generate summary files" >> "$PREVIEW_FILE"

echo "" >> "$PREVIEW_FILE"
echo "## Expected Runtime Artifacts" >> "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/deployment-state/constellation-status.json" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/flows/flow-01/event.txt" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/flows/flow-01/processed.txt" >> "$PREVIEW_FILE"
echo "- /var/log/africamapping/flow.log" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/internal/latest-internal-summary.md" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/operator/latest-operator-summary.md" >> "$PREVIEW_FILE"
echo "- /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/sales/latest-sales-summary.md" >> "$PREVIEW_FILE"

echo "" >> "$PREVIEW_FILE"
echo "## Narrator Pre-Deployment Interpretation" >> "$PREVIEW_FILE"
echo "" >> "$PREVIEW_FILE"
echo "If all reason records are valid, this deployment is expected to proceed through governed flow-01 and generate both runtime and narrated outputs." >> "$PREVIEW_FILE"
echo "If reason validation fails, the flow should not run." >> "$PREVIEW_FILE"

echo "[narrator] deployment preview written to $PREVIEW_FILE"
cat "$PREVIEW_FILE"
