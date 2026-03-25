#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="/opt/africamapping"
STATE_DIR="$BASE_DIR/deployment-state"
LOG_DIR="/var/log/africamapping"
DEPLOY_USER="$(whoami)"

echo "[bootstrap] starting remote bootstrap check"
echo "[bootstrap] deploy user: $DEPLOY_USER"

if ! command -v sudo >/dev/null 2>&1; then
  echo "[bootstrap] ERROR: sudo is not installed"
  exit 1
fi

if ! sudo -n true 2>/dev/null; then
  echo "[bootstrap] ERROR: deploy user does not have passwordless sudo"
  echo "[bootstrap] expected: one deploy user with sudo access"
  exit 1
fi

echo "[bootstrap] sudo access confirmed"

mkdir -p "$BASE_DIR"
mkdir -p "$STATE_DIR"
sudo mkdir -p "$LOG_DIR"

if [ ! -d "$BASE_DIR" ]; then
  echo "[bootstrap] ERROR: could not create $BASE_DIR"
  exit 1
fi

if [ ! -d "$STATE_DIR" ]; then
  echo "[bootstrap] ERROR: could not create $STATE_DIR"
  exit 1
fi

if [ ! -d "$LOG_DIR" ]; then
  echo "[bootstrap] ERROR: could not create $LOG_DIR"
  exit 1
fi

touch "$STATE_DIR/.bootstrap-ok"
sudo touch "$LOG_DIR/bootstrap.log"

echo "[bootstrap] base directories confirmed"
echo "[bootstrap] bootstrap check passed"
echo "[bootstrap] landing is valid"
