#!/usr/bin/env bash
set -euo pipefail

if [ -d "/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/records" ]; then
  BASE="/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/narrator/records"
else
  BASE="Deploy_Servers/server-07-ai-orchestrator/narrator/records"
fi

REQUIRED_FILES=(
  "record-001-heartbeat.md"
  "record-002-flow-01.md"
  "record-003-narrator.md"
)

REQUIRED_SECTIONS=(
  "## Intent"
  "## Classification"
  "## Scope"
  "## Expected Outcome"
  "## Why This Exists"
  "## System Impact"
  "## Risk Level"
  "## Observability"
  "## Status"
)

echo "[narrator] checking required reason records in: $BASE"

MISSING=0
INVALID=0

for file in "${REQUIRED_FILES[@]}"; do
  FULL_PATH="$BASE/$file"

  if [ ! -f "$FULL_PATH" ]; then
    echo "[narrator] MISSING FILE: $FULL_PATH"
    MISSING=1
    continue
  fi

  echo "[narrator] validating: $FULL_PATH"

  for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! grep -q "$section" "$FULL_PATH"; then
      echo "[narrator] INVALID: missing '$section' in $file"
      INVALID=1
    fi
  done
done

if [ "$MISSING" -ne 0 ]; then
  echo "[narrator] reason enforcement failed (missing files)"
  exit 1
fi

if [ "$INVALID" -ne 0 ]; then
  echo "[narrator] reason enforcement failed (invalid structure)"
  exit 1
fi

echo "[narrator] reason enforcement passed (valid structure)"
