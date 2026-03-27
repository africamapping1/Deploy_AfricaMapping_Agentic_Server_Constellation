#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop"
OUT_FILE="$OUT_DIR/latest-health.md"

NARRATOR_SUMMARY="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports/latest-summary.md"
STRATEGY_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/latest-strategy.md"
DECISION_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"

mkdir -p "$OUT_DIR"

echo "# Governance Loop Health" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Component Presence" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

check_file() {
  local label="$1"
  local path="$2"
  if [ -f "$path" ]; then
    echo "- PASS: $label present" >> "$OUT_FILE"
  else
    echo "- FAIL: $label missing" >> "$OUT_FILE"
  fi
}

check_file "Narrator summary" "$NARRATOR_SUMMARY"
check_file "Strategist output" "$STRATEGY_FILE"
check_file "Governor decision" "$DECISION_FILE"

echo "" >> "$OUT_FILE"
echo "## Loop Health Interpretation" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

if grep -q "FAIL:" "$OUT_FILE"; then
  echo "Governance Loop health is degraded." >> "$OUT_FILE"
else
  echo "Governance Loop health is healthy." >> "$OUT_FILE"
fi

echo "[governance-loop] health report written to $OUT_FILE"
cat "$OUT_FILE"
