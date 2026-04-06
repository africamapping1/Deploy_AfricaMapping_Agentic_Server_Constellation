#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-02"
  INPUT_FILE="$FLOW_DIR/activity.txt"
  OUTPUT_FILE="$FLOW_DIR/activity-processed.txt"

  if [ -f "$INPUT_FILE" ]; then
    FOUND=1
    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "processed_by=server-02-app" >> "$OUTPUT_FILE"
    echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "classification=business-activity" >> "$OUTPUT_FILE"
    echo "status=processed" >> "$OUTPUT_FILE"
    echo "[app] $(basename "$TENANT_PATH") activity processed"
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "[app] no tenant activity found"
fi
