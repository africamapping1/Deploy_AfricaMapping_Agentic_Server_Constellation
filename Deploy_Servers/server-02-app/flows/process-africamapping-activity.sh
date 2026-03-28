#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-02"

if [ ! -f "$FLOW_DIR/activity.txt" ]; then
  echo "[app] no AfricaMapping activity found"
  exit 0
fi

cp "$FLOW_DIR/activity.txt" "$FLOW_DIR/activity-processed.txt"
echo "processed_by=server-02-app" >> "$FLOW_DIR/activity-processed.txt"
echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/activity-processed.txt"
echo "classification=business-activity" >> "$FLOW_DIR/activity-processed.txt"
echo "status=processed" >> "$FLOW_DIR/activity-processed.txt"

echo "[app] AfricaMapping activity processed"
