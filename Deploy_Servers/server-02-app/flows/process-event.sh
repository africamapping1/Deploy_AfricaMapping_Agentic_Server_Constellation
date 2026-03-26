#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-01"

if [ ! -f "$FLOW_DIR/event.txt" ]; then
  echo "[app] no event found"
  exit 0
fi

cp "$FLOW_DIR/event.txt" "$FLOW_DIR/processed.txt"
echo "processed_by=server-02-app" >> "$FLOW_DIR/processed.txt"
echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/processed.txt"
echo "status=processed" >> "$FLOW_DIR/processed.txt"

echo "[app] event processed"
