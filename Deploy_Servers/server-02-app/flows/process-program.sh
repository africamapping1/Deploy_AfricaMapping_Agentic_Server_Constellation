#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-04"
  INPUT_FILE="$FLOW_DIR/program.txt"
  OUTPUT_FILE="$FLOW_DIR/program-processed.txt"

  if [ -f "$INPUT_FILE" ]; then
    FOUND=1

    if [ -f "$OUTPUT_FILE" ]; then
      echo "[app] $(basename "$TENANT_PATH") program already processed, skipping"
      continue
    fi

    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "processed_by=server-02-app" >> "$OUTPUT_FILE"
    echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "status=active" >> "$OUTPUT_FILE"

    echo "[app] $(basename "$TENANT_PATH") program processed"
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "[app] no tenant program intake found"
fi
