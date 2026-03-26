#!/usr/bin/env bash
set -euo pipefail

EVENT_ID=$(date +%s)
BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-01"

mkdir -p "$FLOW_DIR"

echo "event_id=$EVENT_ID" > "$FLOW_DIR/event.txt"
echo "created_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/event.txt"
echo "source=server-01-bastion" >> "$FLOW_DIR/event.txt"
echo "status=created" >> "$FLOW_DIR/event.txt"

echo "[bastion] event created: $EVENT_ID"
