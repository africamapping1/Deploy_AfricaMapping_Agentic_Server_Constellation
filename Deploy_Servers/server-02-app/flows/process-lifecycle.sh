#!/bin/bash

FLOW_DIR="/opt/africamapping/flows"

echo "[flow-06] Starting lifecycle processing"

for TYPE in flow-02 flow-03 flow-04; do
  DIR="$FLOW_DIR/$TYPE"

  if [ -d "$DIR" ]; then
    for FILE in "$DIR"/*.txt; do
      [ -e "$FILE" ] || continue

      STATUS=$(grep "status=" "$FILE" | tail -n 1 | cut -d '=' -f2)

      if [ "$STATUS" = "active" ]; then
        echo "[flow-06] progressing $FILE to completed"
        echo "status=completed" >> "$FILE"
      elif [ "$STATUS" = "completed" ]; then
        echo "[flow-06] progressing $FILE to archived"
        echo "status=archived" >> "$FILE"
      fi

    done
  fi
done

echo "[flow-06] Lifecycle processing completed"
