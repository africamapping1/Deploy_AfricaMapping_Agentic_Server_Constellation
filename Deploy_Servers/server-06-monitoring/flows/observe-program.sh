#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-04"
LOG="/var/log/africamapping/flow-04.log"

if [ ! -f "$FLOW_DIR/program-processed.txt" ]; then
  echo "[monitoring] no program to observe" | tee -a "$LOG"
  exit 0
fi

echo "[monitoring] observed Flow-04 at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" | tee -a "$LOG"
cat "$FLOW_DIR/program-processed.txt" | tee -a "$LOG"
echo "---" | tee -a "$LOG"

echo "[monitoring] Flow-04 recorded"
