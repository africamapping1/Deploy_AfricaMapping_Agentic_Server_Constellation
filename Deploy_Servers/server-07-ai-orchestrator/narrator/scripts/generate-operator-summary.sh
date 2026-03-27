#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
REPORT_SRC="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/operator"
OUT_FILE="$OUT_DIR/latest-operator-summary.md"

mkdir -p "$OUT_DIR"

echo "# Operator Narrator Summary" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Audience: deployment and runtime operators" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if [ -f "$REPORT_SRC" ]; then
  cat "$REPORT_SRC" >> "$OUT_FILE"
else
  echo "No base narrator report found." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Operator Emphasis" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "- focus on what just happened" >> "$OUT_FILE"
echo "- focus on logs and state files" >> "$OUT_FILE"
echo "- focus on whether intervention is needed" >> "$OUT_FILE"

echo "[narrator] operator summary written to $OUT_FILE"
