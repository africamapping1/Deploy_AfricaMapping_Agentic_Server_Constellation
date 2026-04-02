#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-04"
  INPUT_FILE="$FLOW_DIR/program-processed.txt"
  OBS_DIR="$TENANT_PATH/observations/flow-04"
  OUTPUT_FILE="$OBS_DIR/program-observed.txt"

  if [ -f "$INPUT_FILE" ]; then
    FOUND=1
    mkdir -p "$OBS_DIR"
    cp "$INPUT_FILE" "$OUTPUT_FILE"
    echo "---" >> "$OUTPUT_FILE"
    echo "observed_by=server-06-monitoring" >> "$OUTPUT_FILE"
    echo "observed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT_FILE"
    echo "[monitoring] observed Flow-04 for tenant: $(basename "$TENANT_PATH")"
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "[monitoring] no tenant program to observe"
fi
