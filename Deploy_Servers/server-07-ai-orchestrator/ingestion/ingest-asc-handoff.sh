#!/bin/bash

echo "=== ASC HANDOFF INGESTION START ==="

HANDOFF_FILE="/opt/africamapping/Deploy_Servers/server-10-applications/asc/handoff-json/africamapping-handoff.json"
OUTPUT_DIR="/opt/africamapping/flows/flow-02"
OUTPUT_FILE="$OUTPUT_DIR/asc-ingested.txt"

mkdir -p $OUTPUT_DIR

if [ ! -f "$HANDOFF_FILE" ]; then
  echo "ERROR: Handoff JSON not found"
  exit 1
fi

echo "Reading handoff..."

TENANT=$(grep '"tenant"' $HANDOFF_FILE | head -1 | cut -d '"' -f4)
PROGRAM=$(grep '"name"' $HANDOFF_FILE | head -1 | cut -d '"' -f4)

echo "Tenant: $TENANT"
echo "Program: $PROGRAM"

echo "Creating ingestion record..."

echo "tenant=$TENANT" > $OUTPUT_FILE
echo "program=$PROGRAM" >> $OUTPUT_FILE
echo "status=ingested" >> $OUTPUT_FILE
echo "timestamp=$(date)" >> $OUTPUT_FILE

echo "ASC handoff ingested successfully."

echo "=== ASC HANDOFF INGESTION END ==="
