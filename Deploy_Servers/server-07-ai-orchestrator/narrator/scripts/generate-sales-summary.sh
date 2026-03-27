#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
STATE_FILE="$BASE/deployment-state/constellation-status.json"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/generated/sales"
OUT_FILE="$OUT_DIR/latest-sales-summary.md"

mkdir -p "$OUT_DIR"

echo "# Sales Narrator Summary" > "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "Audience: product presentation and customer explanation" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## What This Platform Does" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "The Agentic Server Constellation is a governed infrastructure platform that deploys, tracks its own state, routes actions through defined server roles, and explains its own condition." >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Why It Matters" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "- it does not deploy blindly" >> "$OUT_FILE"
echo "- it records heartbeat and deployment state" >> "$OUT_FILE"
echo "- it routes changes through roles and flows" >> "$OUT_FILE"
echo "- it can explain what happened and why" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"

echo "## Current Product Evidence" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
if [ -f "$STATE_FILE" ] && grep -q '"heartbeat_state": "steady"' "$STATE_FILE"; then
  echo "The current deployed constellation is in a steady state." >> "$OUT_FILE"
else
  echo "The current deployed constellation is not yet confirmed steady." >> "$OUT_FILE"
fi

echo "" >> "$OUT_FILE"
echo "## Sales Message" >> "$OUT_FILE"
echo "" >> "$OUT_FILE"
echo "This platform ensures that infrastructure is not only deployed, but governed, observable, and explainable." >> "$OUT_FILE"

echo "[narrator] sales summary written to $OUT_FILE"
