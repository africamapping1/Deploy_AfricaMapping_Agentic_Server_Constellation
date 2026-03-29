#!/bin/bash

LOG_FILE="/var/log/africamapping/infrastructure.log"
OUTPUT_DIR="/opt/africamapping/infrastructure"
REPORT_FILE="$OUTPUT_DIR/latest-health.txt"

mkdir -p "$OUTPUT_DIR"

echo "Generated at: $(date -u +"%Y-%m-%dT%H:%M:%SZ")" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "## Disk Usage" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "## Memory Usage" >> "$REPORT_FILE"
free -m >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "## CPU Load" >> "$REPORT_FILE"
uptime >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "## Restart Required" >> "$REPORT_FILE"
if [ -f /var/run/reboot-required ]; then
  echo "System restart is required." >> "$REPORT_FILE"
else
  echo "No restart required." >> "$REPORT_FILE"
fi
echo "" >> "$REPORT_FILE"

echo "## GPU Check" >> "$REPORT_FILE"
if command -v nvidia-smi &> /dev/null; then
  nvidia-smi >> "$REPORT_FILE"
else
  echo "No GPU detected." >> "$REPORT_FILE"
fi

echo "[monitoring] infrastructure observed at $(date -u)" >> "$LOG_FILE"
