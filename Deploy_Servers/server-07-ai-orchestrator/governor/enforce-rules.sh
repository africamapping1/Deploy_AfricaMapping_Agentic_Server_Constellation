#!/bin/bash

echo "[governor] enforcing rules"

RESULT="PASS"

FLOW_DIR="/opt/africamapping/flows/flow-03"

for FILE in "$FLOW_DIR"/*.txt; do
  [ -e "$FILE" ] || continue

  STATUSES=$(grep '^status=' "$FILE" | cut -d '=' -f2)

  LAST_STATUS=$(echo "$STATUSES" | tail -n 1)
  PREV_STATUS=$(echo "$STATUSES" | tail -n 2 | head -n 1)

  # Rule 1: prevent archived → active
  if [ "$PREV_STATUS" = "archived" ] && [ "$LAST_STATUS" = "active" ]; then
    echo "[governor] INVALID transition in $FILE"
    RESULT="FAIL"
  fi

  # Rule 2: required fields
  grep -q "project_id=" "$FILE" || RESULT="FAIL"
  grep -q "status=" "$FILE" || RESULT="FAIL"
  grep -q "business=" "$FILE" || RESULT="FAIL"

done

if [ "$RESULT" = "FAIL" ]; then
  echo "[governor] enforcement FAILED"
  exit 1
else
  echo "[governor] enforcement PASSED"
fi
