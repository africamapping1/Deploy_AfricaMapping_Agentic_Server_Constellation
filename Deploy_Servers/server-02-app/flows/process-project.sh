#!/bin/bash
set -euo pipefail

FLOW_DIR="/opt/africamapping/flows/flow-03"

LATEST_FILE="$(find "$FLOW_DIR" -maxdepth 1 -type f -name 'project-*.txt' ! -name 'project-processed.txt' | sort | tail -n 1 || true)"

if [ -z "${LATEST_FILE:-}" ]; then
  echo "[app] no project intake found"
  exit 0
fi

PROJECT_ID="$(basename "$LATEST_FILE" .txt)"
PROCESSED_FILE="$FLOW_DIR/${PROJECT_ID}-processed.txt"

if [ -f "$PROCESSED_FILE" ]; then
  echo "[app] $PROJECT_ID already processed, skipping"
  exit 0
fi

cp "$LATEST_FILE" "$PROCESSED_FILE"
echo "processed_by=server-02-app" >> "$PROCESSED_FILE"
echo "processed_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> "$PROCESSED_FILE"
echo "status=active" >> "$PROCESSED_FILE"

cp "$PROCESSED_FILE" "$FLOW_DIR/project-processed.txt"

echo "[app] $PROJECT_ID processed"
