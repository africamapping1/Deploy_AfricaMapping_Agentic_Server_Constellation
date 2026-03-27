#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/records"

REQUIRED_FILES=(
  "record-001-heartbeat.md"
  "record-002-flow-01.md"
  "record-003-narrator.md"
)

echo "[narrator] checking required reason records"

MISSING=0

for file in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$BASE/$file" ]; then
    echo "[narrator] MISSING: $BASE/$file"
    MISSING=1
  else
    echo "[narrator] found: $BASE/$file"
  fi
done

if [ "$MISSING" -ne 0 ]; then
  echo "[narrator] reason enforcement failed"
  exit 1
fi

echo "[narrator] reason enforcement passed"
