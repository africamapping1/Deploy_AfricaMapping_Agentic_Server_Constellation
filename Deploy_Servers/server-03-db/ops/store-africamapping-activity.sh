#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-02"
DB_DIR="$BASE/db/africamapping"
DB_FILE="$DB_DIR/activities.log"

mkdir -p "$DB_DIR"

if [ ! -f "$FLOW_DIR/activity-processed.txt" ]; then
  echo "[db] no processed AfricaMapping activity found"
  exit 0
fi

echo "-----" >> "$DB_FILE"
cat "$FLOW_DIR/activity-processed.txt" >> "$DB_FILE"
echo "stored_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$DB_FILE"

echo "[db] AfricaMapping activity stored"
