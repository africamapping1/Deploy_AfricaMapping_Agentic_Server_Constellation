#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-03"
LOG="/var/log/africamapping/flow-03.log"

if [ ! -f "$FLOW_DIR/project-processed.txt" ]; then
  echo "[monitoring] no project to observe" | tee -a "$LOG"
  exit 0
fi

echo "[monitoring] observed Flow-03 at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" | tee -a "$LOG"
cat "$FLOW_DIR/project-processed.txt" | tee -a "$LOG"
echo "---" | tee -a "$LOG"

echo "[monitoring] Flow-03 recorded"
