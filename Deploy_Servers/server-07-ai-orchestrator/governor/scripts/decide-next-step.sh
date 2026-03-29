#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions"
OUTPUT_FILE="$OUTPUT_DIR/latest-decision.md"
REL_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
STRATEGY_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/latest-strategy.md"

mkdir -p "$OUTPUT_DIR"

echo "# Governor Decision" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

if [ -f "$REL_FILE" ] && grep -q "RESULT=FAIL" "$REL_FILE"; then
  echo "## Decision" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "REVIEW REQUIRED: Program-to-project relationships are invalid." >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  echo "## Policy Applied" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "Do not approve expansion when program relationships reference missing project state." >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  echo "## Governor Interpretation" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "The system is stable at infrastructure level, but business structure is inconsistent and should be corrected before further expansion." >> "$OUTPUT_FILE"

elif [ -f "$STRATEGY_FILE" ]; then
  echo "## Decision" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "APPROVED: System is stable. Expansion actions are allowed." >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  echo "## Policy Applied" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "Allow changes only when system risk is low and stability is confirmed." >> "$OUTPUT_FILE"
else
  echo "## Decision" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "REVIEW REQUIRED: No strategist output found." >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  echo "## Policy Applied" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "Do not approve expansion without strategist interpretation." >> "$OUTPUT_FILE"
fi

echo "[governor] decision written to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
