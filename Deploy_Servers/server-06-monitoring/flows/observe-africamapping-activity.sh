#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-02"
LOG="/var/log/africamapping/flow-02.log"

if [ ! -f "$FLOW_DIR/activity-processed.txt" ]; then
  echo "[monitoring] no processed AfricaMapping activity to observe" | tee -a "$LOG"
  exit 0
fi

echo "[monitoring] observed Flow-02 at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" | tee -a "$LOG"
cat "$FLOW_DIR/activity-processed.txt" | tee -a "$LOG"
echo "---" | tee -a "$LOG"

echo "[monitoring] Flow-02 observation recorded"
