#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-03"
ACTIVE_DIR="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/projects/active"

mkdir -p "$ACTIVE_DIR"

if [ ! -f "$FLOW_DIR/project.txt" ]; then
  echo "[app] no project found"
  exit 0
fi

cp "$FLOW_DIR/project.txt" "$FLOW_DIR/project-processed.txt"

echo "processed_by=server-02-app" >> "$FLOW_DIR/project-processed.txt"
echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/project-processed.txt"
echo "status=active" >> "$FLOW_DIR/project-processed.txt"

cp "$FLOW_DIR/project-processed.txt" "$ACTIVE_DIR/project-001.txt"

echo "[app] project processed and activated"
