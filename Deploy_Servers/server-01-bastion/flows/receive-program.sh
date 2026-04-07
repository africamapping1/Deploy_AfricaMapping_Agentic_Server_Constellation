#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
APPS_DIR="$BASE/Deploy_Servers/server-10-applications/apps"

for APP in "$APPS_DIR"/*; do
  [ -d "$APP" ] || continue

  for INPUT_FILE in "$APP/programs/intake/"*.txt; do
    [ -f "$INPUT_FILE" ] || continue

    BUSINESS=$(grep '^business=' "$INPUT_FILE" | head -n 1 | cut -d '=' -f2- | tr '[:upper:]' '[:lower:]')
    if [ -z "${BUSINESS:-}" ]; then
      BUSINESS="unknown"
    fi

    TENANT_DIR="$BASE/tenants/$BUSINESS"
    FLOW_DIR="$TENANT_DIR/flows/flow-04"

    mkdir -p "$FLOW_DIR"

    FILENAME=$(basename "$INPUT_FILE")
    DEST_FILE="$FLOW_DIR/$FILENAME"

    cp "$INPUT_FILE" "$DEST_FILE"

    PROGRAM_ID=$(grep '^program_id=' "$DEST_FILE" | head -n 1 | cut -d '=' -f2- || true)
    if [ -z "${PROGRAM_ID:-}" ]; then
      PROGRAM_ID="$(basename "$FILENAME" .txt)"
    fi

    if ! grep -q '^tenant_id=' "$DEST_FILE"; then
      echo "tenant_id=$BUSINESS" >> "$DEST_FILE"
    fi

    if ! grep -q '^local_program_id=' "$DEST_FILE"; then
      echo "local_program_id=$PROGRAM_ID" >> "$DEST_FILE"
    fi

    if ! grep -q '^global_program_id=' "$DEST_FILE"; then
      echo "global_program_id=$BUSINESS:$PROGRAM_ID" >> "$DEST_FILE"
    fi

    echo "received_by=server-01-bastion" >> "$DEST_FILE"
    echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$DEST_FILE"

    echo "[bastion] program received for tenant: $BUSINESS"
  done
done
