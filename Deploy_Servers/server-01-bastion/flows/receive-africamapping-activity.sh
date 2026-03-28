#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
SRC_DIR="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/activities/intake"
FLOW_DIR="$BASE/flows/flow-02"

mkdir -p "$FLOW_DIR"

LATEST_FILE="$(find "$SRC_DIR" -maxdepth 1 -type f -name '*.txt' | sort | tail -n 1 || true)"

if [ -z "${LATEST_FILE:-}" ]; then
  echo "[bastion] no AfricaMapping activity intake found"
  exit 0
fi

cp "$LATEST_FILE" "$FLOW_DIR/activity.txt"
echo "received_by=server-01-bastion" >> "$FLOW_DIR/activity.txt"
echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/activity.txt"

echo "[bastion] AfricaMapping activity received"
