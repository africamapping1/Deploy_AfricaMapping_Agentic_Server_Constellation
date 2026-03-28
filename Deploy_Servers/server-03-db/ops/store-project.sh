#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/flows/flow-03"
DB_DIR="$BASE/db/africamapping/projects"
DB_FILE="$DB_DIR/projects.log"

mkdir -p "$DB_DIR"

if [ ! -f "$FLOW_DIR/project-processed.txt" ]; then
  echo "[db] no processed project found"
  exit 0
fi

echo "-----" >> "$DB_FILE"
cat "$FLOW_DIR/project-processed.txt" >> "$DB_FILE"
echo "stored_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$DB_FILE"

echo "[db] project stored"
