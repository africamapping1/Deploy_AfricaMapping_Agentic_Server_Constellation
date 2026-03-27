#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
STRATEGY_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/latest-strategy.md"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions"
OUT_FILE="$OUT_DIR/latest-decision.md"

mkdir -p "$OUT_DIR"

echo "# Governor Decision" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Decision" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

# Simple policy:
# If strategist says "No immediate risks detected" → APPROVED
# Otherwise → BLOCKED

if grep -q "No immediate risks detected" "$STRATEGY_FILE"; then
  echo "APPROVED: System is stable. Expansion actions are allowed." >> "$OUT_FILE"
else
  echo "BLOCKED: Risks detected. Resolve issues before proceeding." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Policy Applied" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Allow changes only when system risk is low and stability is confirmed." >> "$OUT_FILE"

echo "[governor] decision written to $OUT_FILE"
cat "$OUT_FILE"
