#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"

FOUND=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW_DIR="$TENANT_PATH/flows/flow-03"

  LATEST_FILE="$(find "$FLOW_DIR" -maxdepth 1 -type f -name 'project-*.txt' ! -name 'project-*-processed.txt' | sort | tail -n 1 || true)"

  if [ -n "${LATEST_FILE:-}" ]; then
    FOUND=1

    PROJECT_ID="$(basename "$LATEST_FILE" .txt)"
    PROCESSED_FILE="$FLOW_DIR/${PROJECT_ID}-processed.txt"

    if [ -f "$PROCESSED_FILE" ]; then
      echo "[app] $(basename "$TENANT_PATH") $PROJECT_ID already processed, skipping"
      continue
    fi

    cp "$LATEST_FILE" "$PROCESSED_FILE"
    echo "processed_by=server-02-app" >> "$PROCESSED_FILE"
    echo "processed_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$PROCESSED_FILE"
    echo "status=active" >> "$PROCESSED_FILE"

    echo "[app] $(basename "$TENANT_PATH") $PROJECT_ID processed"
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "[app] no tenant project intake found"
fi
