#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping/tenants"

echo "[flow-06] Starting lifecycle processing"

for TENANT in "$BASE"/*; do
  [ -d "$TENANT" ] || continue

  FLOW_DIR="$TENANT/flows/flow-03"

  for FILE in "$FLOW_DIR"/*-processed.txt; do
    [ -f "$FILE" ] || continue

    CURRENT_STATUS=$(grep '^status=' "$FILE" | tail -n 1 | cut -d '=' -f2)

    case "$CURRENT_STATUS" in
      intake)
        echo "status=active" >> "$FILE"
        echo "[flow-06] $(basename "$FILE") moved intake → active"
        ;;
      
      active)
        # DO NOT AUTO COMPLETE
        echo "[flow-06] $(basename "$FILE") remains active"
        ;;
      
      completed)
        # DO NOT AUTO ARCHIVE
        echo "[flow-06] $(basename "$FILE") remains completed"
        ;;
      
      *)
        echo "[flow-06] $(basename "$FILE") no change"
        ;;
    esac

  done
done

echo "[flow-06] Lifecycle processing completed"
