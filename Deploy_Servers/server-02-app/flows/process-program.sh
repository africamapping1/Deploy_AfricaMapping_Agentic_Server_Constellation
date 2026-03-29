#!/bin/bash

FLOW_DIR="/opt/africamapping/flows/flow-04"
INTAKE_FILE="$FLOW_DIR/program.txt"
PROCESSED_FILE="$FLOW_DIR/program-processed.txt"

# Skip if already processed
if [ -f "$PROCESSED_FILE" ]; then
  echo "[app] program already processed, skipping"
  exit 0
fi

if [ -f "$INTAKE_FILE" ]; then
  cp "$INTAKE_FILE" "$PROCESSED_FILE"
  echo "status=active" >> "$PROCESSED_FILE"
  echo "processed_at=$(date -u +"%Y-%m-%dT%H:%M:%SZ")" >> "$PROCESSED_FILE"
  echo "[app] program processed"
else
  echo "[app] no program intake found"
fi
