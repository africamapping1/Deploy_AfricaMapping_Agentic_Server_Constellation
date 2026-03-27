#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
HISTORY_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/history"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports"
OUT_FILE="$OUT_DIR/history-summary.md"

mkdir -p "$OUT_DIR"

echo "# Narrator History Summary" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## What This History Is" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "This history records how the constellation evolved through deployment, governed flow execution, narrator reasoning, and validation." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Audit Entries" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
if ls "$HISTORY_DIR"/audit-*.md >/dev/null 2>&1; then
  ls -1 "$HISTORY_DIR"/audit-*.md | sed 's#^.*/#- #' >> "$OUT_FILE"
else
  echo "No audit entries found." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Narrator Interpretation" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "The constellation maintains a deployment history so that future operators, designers, and decision-makers can understand what was created, when it changed, and how it behaved." >> "$OUT_FILE"

echo "[narrator] history summary written to $OUT_FILE"
