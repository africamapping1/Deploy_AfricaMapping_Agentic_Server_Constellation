#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions"
OUTPUT_FILE="$OUTPUT_DIR/latest-decision.md"
REL_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
STRATEGY_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/latest-strategy.md"

mkdir -p "$OUTPUT_DIR"

DECISION=""
POLICY=""
INTERPRETATION=""

if [ -f "$REL_FILE" ] && grep -q "RESULT=FAIL" "$REL_FILE"; then
  DECISION="REVIEW REQUIRED: Program-to-project relationships are invalid."
  POLICY="Do not approve expansion when program relationships reference missing project state."
  INTERPRETATION="The system is stable at infrastructure level, but business structure is inconsistent and should be corrected before further expansion."

elif [ -f "$STRATEGY_FILE" ] && grep -q "system idle risk" "$STRATEGY_FILE"; then
  DECISION="WARNING: No active work detected. Consider introducing new inputs."
  POLICY="Do not treat an idle system as growth-ready without new operational input."
  INTERPRETATION="The platform is healthy, but it is showing signs of inactivity and should receive new work before expansion is evaluated."

elif [ -f "$STRATEGY_FILE" ] && grep -q "cycling too fast" "$STRATEGY_FILE"; then
  DECISION="CAUTION: Work lifecycle too fast. Review process depth."
  POLICY="Do not approve expansion when work is cycling faster than expected without review."
  INTERPRETATION="The platform is functioning, but the pace of lifecycle transitions suggests process depth should be reviewed before further expansion."

else
  DECISION="APPROVED: System is stable. Expansion actions are allowed."
  POLICY="Allow changes only when system risk is low and stability is confirmed."
  INTERPRETATION="The platform is stable, aligned, and ready for controlled continuation."
fi

echo "# Governor Decision" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "## Decision" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "$DECISION" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "## Policy Applied" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "$POLICY" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "## Governor Interpretation" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"
echo "$INTERPRETATION" >> "$OUTPUT_FILE"

echo "[governor] decision written to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
