#!/bin/bash

FLOW_DIR="/opt/africamapping/flows/flow-03"
INTAKE_FILE="$FLOW_DIR/project.txt"
PROCESSED_FILE="$FLOW_DIR/project-processed.txt"

# Skip if already processed
if [ -f "$PROCESSED_FILE" ]; then
  echo "[app] project already processed, skipping"
  exit 0
fi

if [ -f "$INTAKE_FILE" ]; then
  cp "$INTAKE_FILE" "$PROCESSED_FILE"
  echo "status=active" >> "$PROCESSED_FILE"
  echo "processed_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> "$PROCESSED_FILE"
  echo "[app] project processed"
else
  echo "[app] no project intake found"
fi
