#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
SRC_DIR="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/programs/intake"
FLOW_DIR="$BASE/flows/flow-04"

mkdir -p "$FLOW_DIR"

LATEST_FILE="$(find "$SRC_DIR" -type f -name '*.txt' | sort | tail -n 1 || true)"

if [ -z "${LATEST_FILE:-}" ]; then
  echo "[bastion] no program intake found"
  exit 0
fi

cp "$LATEST_FILE" "$FLOW_DIR/program.txt"
echo "received_by=server-01-bastion" >> "$FLOW_DIR/program.txt"
echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/program.txt"

echo "[bastion] program received"
