#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/africamapping/Deploy_Servers/server-02-app/app"
APP_FILE="$APP_DIR/constellation_service.py"
SERVICE_FILE="/etc/systemd/system/constellation.service"
STATE_DIR="/opt/africamapping/app-state"

if [ ! -f "$APP_FILE" ]; then
  echo "ERROR: $APP_FILE not found -- did the payload sync run first?" >&2
  exit 1
fi

mkdir -p "$STATE_DIR"

PYTHON_BIN="$(command -v python3 || true)"
if [ -z "$PYTHON_BIN" ]; then
  echo "ERROR: python3 not found on host" >&2
  exit 1
fi

sudo tee "$SERVICE_FILE" > /dev/null <<UNIT
[Unit]
Description=Constellation app service (proof of concept)
After=network.target

[Service]
Type=simple
ExecStart=$PYTHON_BIN $APP_FILE
Restart=on-failure
RestartSec=3
Environment=CONSTELLATION_PORT=80
WorkingDirectory=$APP_DIR

[Install]
WantedBy=multi-user.target
UNIT

sudo systemctl daemon-reload
sudo systemctl enable constellation.service
sudo systemctl restart constellation.service
sleep 1
sudo systemctl --no-pager --full status constellation.service || true

echo "Constellation service deployed and (re)started on port 80."
