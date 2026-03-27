#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
STATE_FILE="$BASE/deployment-state/constellation-status.json"
FLOW_DIR="$BASE/flows/flow-01"
DEPLOY_LOG="/var/log/africamapping/deploy.log"
FLOW_LOG="/var/log/africamapping/flow.log"
REPORT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/narrator/reports"
REPORT_FILE="$REPORT_DIR/latest-summary.md"

mkdir -p "$REPORT_DIR"

echo "# Constellation Narrator Summary" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ -f "$STATE_FILE" ]; then
  echo "## Deployment State" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  grep -E '"heartbeat_state"|"last_deploy_result"|"last_deploy_at"|"last_flow"' "$STATE_FILE" >> "$REPORT_FILE" || true
  echo "" >> "$REPORT_FILE"
else
  echo "## Deployment State" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "No deployment state file found." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
fi

if [ -f "$FLOW_DIR/event.txt" ]; then
  echo "## Latest Event" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  cat "$FLOW_DIR/event.txt" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
else
  echo "## Latest Event" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "No event file found." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
fi

if [ -f "$FLOW_DIR/processed.txt" ]; then
  echo "## Latest Processed Event" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  cat "$FLOW_DIR/processed.txt" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
else
  echo "## Latest Processed Event" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "No processed event found." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
fi

echo "## Narrator Interpretation" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

if [ -f "$STATE_FILE" ] && grep -q '"heartbeat_state": "steady"' "$STATE_FILE"; then
  echo "The constellation appears healthy and in a steady state." >> "$REPORT_FILE"
else
  echo "The constellation does not currently appear steady. Review deployment state." >> "$REPORT_FILE"
fi

if [ -f "$FLOW_DIR/processed.txt" ]; then
  echo "The governed flow from bastion to app to monitoring has executed and produced observable output." >> "$REPORT_FILE"
else
  echo "No completed governed flow output was found." >> "$REPORT_FILE"
fi

echo "" >> "$REPORT_FILE"
echo "## Recent Deploy Log Tail" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
if [ -f "$DEPLOY_LOG" ]; then
  tail -n 10 "$DEPLOY_LOG" >> "$REPORT_FILE"
else
  echo "No deploy log found." >> "$REPORT_FILE"
fi

echo "" >> "$REPORT_FILE"
echo "## Recent Flow Log Tail" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
if [ -f "$FLOW_LOG" ]; then
  tail -n 10 "$FLOW_LOG" >> "$REPORT_FILE"
else
  echo "No flow log found." >> "$REPORT_FILE"
fi

echo "[narrator] summary written to $REPORT_FILE"
cat "$REPORT_FILE"
