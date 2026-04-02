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

    cp "$INPUT_FILE" "$FLOW_DIR/program.txt"

    echo "received_by=server-01-bastion" >> "$FLOW_DIR/program.txt"
    echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/program.txt"

    echo "[bastion] program received for tenant: $BUSINESS"
  done
done
