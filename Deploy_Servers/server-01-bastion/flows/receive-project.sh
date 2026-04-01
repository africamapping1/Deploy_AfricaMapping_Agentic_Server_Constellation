#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
SRC_DIR="$BASE/Deploy_Servers/server-10-applications/apps/africamapping/projects/intake"

LATEST_FILE="$(find "$SRC_DIR" -type f -name '*.txt' | sort | tail -n 1 || true)"

if [ -z "${LATEST_FILE:-}" ]; then
  echo "[bastion] no project intake found"
  exit 0
fi

BUSINESS=$(grep '^business=' "$LATEST_FILE" | head -n 1 | cut -d '=' -f2- | tr '[:upper:]' '[:lower:]')
if [ -z "${BUSINESS:-}" ]; then
  BUSINESS="unknown"
fi

TENANT_DIR="$BASE/tenants/$BUSINESS"
FLOW_DIR="$TENANT_DIR/flows/flow-03"

mkdir -p "$FLOW_DIR"

BASENAME="$(basename "$LATEST_FILE")"

cp "$LATEST_FILE" "$FLOW_DIR/project.txt"
cp "$LATEST_FILE" "$FLOW_DIR/$BASENAME"

echo "received_by=server-01-bastion" >> "$FLOW_DIR/project.txt"
echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/project.txt"

echo "received_by=server-01-bastion" >> "$FLOW_DIR/$BASENAME"
echo "received_at=$(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$FLOW_DIR/$BASENAME"

echo "[bastion] project received for tenant: $BUSINESS ($BASENAME)"
