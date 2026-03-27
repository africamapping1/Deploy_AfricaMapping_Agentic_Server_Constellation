#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
REPORT_SRC="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/internal"
OUT_FILE="$OUT_DIR/latest-internal-summary.md"

mkdir -p "$OUT_DIR"

echo "# Internal Narrator Summary" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Audience: engineering and governance" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if [ -f "$REPORT_SRC" ]; then
  cat "$REPORT_SRC" >> "$OUT_FILE"
else
  echo "No base narrator report found." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Internal Emphasis" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "- focus on system health" >> "$OUT_FILE"
echo "- focus on flow execution" >> "$OUT_FILE"
echo "- focus on governance and structure" >> "$OUT_FILE"

echo "[narrator] internal summary written to $OUT_FILE"
