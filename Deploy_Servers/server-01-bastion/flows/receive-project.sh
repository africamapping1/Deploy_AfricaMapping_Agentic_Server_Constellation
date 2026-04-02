#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
APPS_DIR="$BASE/Deploy_Servers/server-10-applications/apps"

for APP in "$APPS_DIR"/*; do
  [ -d "$APP" ] || continue

  for INPUT_FILE in "$APP/projects/intake/"*.txt; do
    [ -f "$INPUT_FILE" ] || continue

    BUSINESS=$(grep '^business=' "$INPUT_FILE" | head -n 1 | cut -d '=' -f2- | tr '[:upper:]' '[:lower:]')
    if [ -z "${BUSINESS:-}" ]; then
      BUSINESS="unknown"
    fi

    TENANT_DIR="$BASE/tenants/$BUSINESS"
    FLOW_DIR="$TENANT_DIR/flows/flow-03"

    mkdir -p "$FLOW_DIR"

    FILENAME=$(basename "$INPUT_FILE")

    cp "$INPUT_FILE" "$FLOW_DIR/$FILENAME"

    echo "received_by=server-01-bastion" >> "$FLOW_DIR/$FILENAME"
    echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/$FILENAME"

    echo "[bastion] project received for tenant: $BUSINESS ($FILENAME)"
  done
done
