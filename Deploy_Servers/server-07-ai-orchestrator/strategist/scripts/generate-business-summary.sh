#!/bin/bash

OUTPUT="/opt/africamapping/business/latest-summary.md"

mkdir -p /opt/africamapping/business

echo "# Business Summary" > "$OUTPUT"
echo "" >> "$OUTPUT"

echo "## Active Projects" >> "$OUTPUT"
echo "" >> "$OUTPUT"

for f in /opt/africamapping/flows/flow-03/*; do
  [ -e "$f" ] || continue
  echo "- $(basename "$f")" >> "$OUTPUT"
done

echo "" >> "$OUTPUT"
echo "Generated at $(date -u)" >> "$OUTPUT"
