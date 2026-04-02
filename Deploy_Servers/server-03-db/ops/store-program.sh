#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-04"
  INPUT_FILE="$FLOW_DIR/program-processed.txt"
  DATA_DIR="$TENANT_PATH/data/flow-04"
  OUTPUT_FILE="$DATA_DIR/program-stored.txt"

  if [ -f "$INPUT_FILE" ]; then
    FOUND=1
    mkdir -p "$DATA_DIR"
    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "stored_by=server-03-db" >> "$OUTPUT_FILE"
    echo "stored_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "[db] $(basename "$TENANT_PATH") program stored"
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "[db] no tenant program to store"
fi
