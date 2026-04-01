#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
INPUT_FILE="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/activities/intake/activity-001.txt"

BUSINESS=$(grep '^business=' "$INPUT_FILE" | head -n 1 | cut -d '=' -f2- | tr '[:upper:]' '[:lower:]')
if [ -z "${BUSINESS:-}" ]; then
  BUSINESS="unknown"
fi

TENANT_DIR="$BASE/tenants/$BUSINESS"
FLOW_DIR="$TENANT_DIR/flows/flow-02"

mkdir -p "$FLOW_DIR"

cp "$INPUT_FILE" "$FLOW_DIR/activity.txt"

echo "received_by=server-01-bastion" >> "$FLOW_DIR/activity.txt"
echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/activity.txt"

echo "[bastion] ${BUSINESS} activity received"
