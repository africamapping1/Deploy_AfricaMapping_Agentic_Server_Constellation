#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-01"
LOG="/var/log/africamapping/flow.log"

if [ ! -f "$FLOW_DIR/processed.txt" ]; then
  echo "[monitoring] nothing to observe" | tee -a "$LOG"
  exit 0
fi

echo "[monitoring] observed event at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" | tee -a "$LOG"
cat "$FLOW_DIR/processed.txt" | tee -a "$LOG"
echo "---" | tee -a "$LOG"

echo "[monitoring] event observation recorded"
