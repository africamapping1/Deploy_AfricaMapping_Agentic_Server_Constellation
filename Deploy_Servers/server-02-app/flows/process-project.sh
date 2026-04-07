#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  TENANT_NAME="$(basename "$TENANT_PATH")"
  FLOW_DIR="$TENANT_PATH/flows/flow-03"
  [ -d "$FLOW_DIR" ] || continue

  for INPUT_FILE in "$FLOW_DIR"/project-*.txt; do
    [ -f "$INPUT_FILE" ] || continue

    case "$INPUT_FILE" in
      *-processed.txt) continue ;;
    esac

    FOUND=1

    PROJECT_ID="$(basename "$INPUT_FILE" .txt)"
    PROCESSED_FILE="$FLOW_DIR/${PROJECT_ID}-processed.txt"

    if [ -f "$PROCESSED_FILE" ]; then
      echo "[app] $TENANT_NAME $PROJECT_ID already processed, skipping"
      continue
    fi

    cp "$INPUT_FILE" "$PROCESSED_FILE"

    if ! grep -q '^tenant_id=' "$PROCESSED_FILE"; then
      echo "tenant_id=$TENANT_NAME" >> "$PROCESSED_FILE"
    fi

    if ! grep -q '^local_project_id=' "$PROCESSED_FILE"; then
      echo "local_project_id=$PROJECT_ID" >> "$PROCESSED_FILE"
    fi

    if ! grep -q '^global_project_id=' "$PROCESSED_FILE"; then
      echo "global_project_id=$TENANT_NAME:$PROJECT_ID" >> "$PROCESSED_FILE"
    fi

    echo "processed_by=server-02-app" >> "$PROCESSED_FILE"
    echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$PROCESSED_FILE"
    echo "status=active" >> "$PROCESSED_FILE"

    echo "[app] $TENANT_NAME $PROJECT_ID processed"
  done
done

if [ "$FOUND" -eq 0 ]; then
  echo "[app] no tenant project intake found"
fi
