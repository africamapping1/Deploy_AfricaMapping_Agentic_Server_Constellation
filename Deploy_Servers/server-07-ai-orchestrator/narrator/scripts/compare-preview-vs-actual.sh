#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
PREVIEW_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/previews/latest-deployment-preview.md"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports"
OUT_FILE="$OUT_DIR/latest-comparison.md"

mkdir -p "$OUT_DIR"

echo "# Preview vs Actual Comparison" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

check_file() {
  local path="$1"
  if [ -f "$path" ]; then
    echo "- PASS: $path exists" >> "$OUT_FILE"
  else
    echo "- FAIL: $path missing" >> "$OUT_FILE"
  fi
}

echo "## Expected Runtime Artifacts Check" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
check_file "/opt/africamapping/deployment-state/constellation-status.json"
check_file "/opt/africamapping/flows/flow-01/event.txt"
check_file "/opt/africamapping/flows/flow-01/processed.txt"
check_file "/var/log/africamapping/flow.log"
check_file "/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
check_file "/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/internal/latest-internal-summary.md"
check_file "/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/operator/latest-operator-summary.md"
check_file "/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/sales/latest-sales-summary.md"

echo "" >> "$OUT_FILE"
echo "## Interpretation" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if grep -q "FAIL:" "$OUT_FILE"; then
  echo "The deployment did not fully match expected runtime artifacts." >> "$OUT_FILE"
else
  echo "The deployment matched expected runtime artifacts." >> "$OUT_FILE"
fi

echo "[narrator] comparison report written to $OUT_FILE"
cat "$OUT_FILE"
