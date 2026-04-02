#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-03"
  DATA_DIR="$TENANT_PATH/data/flow-03"
  mkdir -p "$DATA_DIR"

  for INPUT_FILE in "$FLOW_DIR"/*-processed.txt; do
    [ -f "$INPUT_FILE" ] || continue
    FOUND=1

    BASENAME="$(basename "$INPUT_FILE")"
    OUTPUT_FILE="$DATA_DIR/$BASENAME"

    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "stored_by=server-03-db" >> "$OUTPUT_FILE"
    echo "stored_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "[db] $(basename "$TENANT_PATH") project stored: $BASENAME"
  done
done

if [ "$FOUND" -eq 0 ]; then
  echo "[db] no tenant processed project found"
fi
