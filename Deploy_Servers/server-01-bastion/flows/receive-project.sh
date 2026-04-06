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
    DEST_FILE="$FLOW_DIR/$FILENAME"

    cp "$INPUT_FILE" "$DEST_FILE"

    PROJECT_ID=$(grep '^project_id=' "$DEST_FILE" | head -n 1 | cut -d '=' -f2- || true)
    if [ -z "${PROJECT_ID:-}" ]; then
      PROJECT_ID="$(basename "$FILENAME" .txt)"
    fi

    if ! grep -q '^tenant_id=' "$DEST_FILE"; then
      echo "tenant_id=$BUSINESS" >> "$DEST_FILE"
    fi

    if ! grep -q '^local_project_id=' "$DEST_FILE"; then
      echo "local_project_id=$PROJECT_ID" >> "$DEST_FILE"
    fi

    if ! grep -q '^global_project_id=' "$DEST_FILE"; then
      echo "global_project_id=$BUSINESS:$PROJECT_ID" >> "$DEST_FILE"
    fi

    echo "received_by=server-01-bastion" >> "$DEST_FILE"
    echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$DEST_FILE"

    echo "[bastion] project received for tenant: $BUSINESS ($FILENAME)"
  done
done
