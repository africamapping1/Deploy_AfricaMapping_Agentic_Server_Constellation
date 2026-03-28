#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-04"
ACTIVE_DIR="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/programs/active"

mkdir -p "$ACTIVE_DIR"

if [ ! -f "$FLOW_DIR/program.txt" ]; then
  echo "[app] no program found"
  exit 0
fi

cp "$FLOW_DIR/program.txt" "$FLOW_DIR/program-processed.txt"

echo "processed_by=server-02-app" >> "$FLOW_DIR/program-processed.txt"
echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/program-processed.txt"
echo "status=active" >> "$FLOW_DIR/program-processed.txt"

cp "$FLOW_DIR/program-processed.txt" "$ACTIVE_DIR/program-001.txt"

echo "[app] program processed and activated"
