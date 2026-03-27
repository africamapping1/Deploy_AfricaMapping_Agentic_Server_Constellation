#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
OUT_FILE="$OUT_DIR/latest-strategy.md"

SUMMARY="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
COMPARISON="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-comparison.md"

mkdir -p "$OUT_DIR"

echo "# Strategist Analysis" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## System Interpretation" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if grep -q "matched expected runtime artifacts" "$COMPARISON"; then
  echo "The system is behaving as expected and is stable." >> "$OUT_FILE"
else
  echo "The system is not fully aligned with expectations." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Risks" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if grep -q "FAIL:" "$COMPARISON"; then
  echo "- Some expected artifacts are missing." >> "$OUT_FILE"
else
  echo "- No immediate risks detected." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Suggested Next Steps" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "- Introduce flow-02 for extended system behavior" >> "$OUT_FILE"
echo "- Expand monitoring depth" >> "$OUT_FILE"
echo "- Validate system under increased load" >> "$OUT_FILE"

echo "" >> "$OUT_FILE"
echo "## Strategic Note" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "The constellation is transitioning from deployment validation to operational expansion." >> "$OUT_FILE"

echo "[strategist] analysis written to $OUT_FILE"
cat "$OUT_FILE"
