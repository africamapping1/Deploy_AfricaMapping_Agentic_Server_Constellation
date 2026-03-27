#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
HISTORY_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/history"
STATE_FILE="$BASE/deployment-state/constellation-status.json"
COMPARISON_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-comparison.md"
STAMP="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
OUT_FILE="$HISTORY_DIR/audit-$STAMP.md"

mkdir -p "$HISTORY_DIR"

echo "# Narrator Audit Entry" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Timestamp: $STAMP" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Deployment State Snapshot" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
if [ -f "$STATE_FILE" ]; then
  cat "$STATE_FILE" >> "$OUT_FILE"
else
  echo "No deployment state found." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Comparison Snapshot" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
if [ -f "$COMPARISON_FILE" ]; then
  cat "$COMPARISON_FILE" >> "$OUT_FILE"
else
  echo "No comparison report found." >> "$OUT_FILE"
fi

echo "[narrator] audit entry written to $OUT_FILE"
