#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-03"
  OBS_DIR="$TENANT_PATH/observations/flow-03"
  mkdir -p "$OBS_DIR"

  for INPUT_FILE in "$FLOW_DIR"/*-processed.txt; do
    [ -f "$INPUT_FILE" ] || continue
    FOUND=1

    BASENAME="$(basename "$INPUT_FILE")"
    OUTPUT_FILE="$OBS_DIR/$BASENAME"

    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
    echo "observed_by=server-06-monitoring" >> "$OUTPUT_FILE"
    echo "observed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "[monitoring] observed Flow-03 for tenant: $(basename "$TENANT_PATH") ($BASENAME)"
  done
done

if [ "$FOUND" -eq 0 ]; then
  echo "[monitoring] no tenant project to observe"
fi
