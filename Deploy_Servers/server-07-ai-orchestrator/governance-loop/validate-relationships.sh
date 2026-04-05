#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"
REPORT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop"
REPORT_FILE="$REPORT_DIR/relationship-validation.md"

mkdir -p "$REPORT_DIR"

echo "# Relationship Validation Report" > "$REPORT_FILE"
echo "" >> "$REPORT_FILE"
echo "Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

FOUND_PROGRAM=0
MISSING=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  TENANT_NAME="$(basename "$TENANT_PATH")"
  PROGRAM_FILE="$TENANT_PATH/flows/flow-04/program-processed.txt"
  PROJECT_DIR="$TENANT_PATH/flows/flow-03"

  echo "## Tenant: $TENANT_NAME" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"

  if [ ! -f "$PROGRAM_FILE" ]; then
    echo "No processed program file found." >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
    continue
  fi

  FOUND_PROGRAM=1

  echo "### Program" >> "$REPORT_FILE"
  grep "^program_id=" "$PROGRAM_FILE" >> "$REPORT_FILE" || true
  grep "^name=" "$PROGRAM_FILE" >> "$REPORT_FILE" || true
  echo "" >> "$REPORT_FILE"

  echo "### Project Relationship Checks" >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"

  while IFS= read -r project_id; do
    [ -n "$project_id" ] || continue
    PROJECT_FILE="$PROJECT_DIR/${project_id}-processed.txt"

    if [ -f "$PROJECT_FILE" ]; then
      echo "- PASS: $project_id exists" >> "$REPORT_FILE"
    else
      echo "- FAIL: $project_id is referenced by the program but missing from processed project state" >> "$REPORT_FILE"
      MISSING=1
    fi
  done < <(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$PROGRAM_FILE")

  echo "" >> "$REPORT_FILE"
done

if [ "$FOUND_PROGRAM" -eq 0 ]; then
  echo "## Result" >> "$REPORT_FILE"
  echo "No processed program file found for any tenant." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "RESULT=NO_PROGRAM" >> "$REPORT_FILE"
elif [ "$MISSING" -eq 0 ]; then
  echo "## Result" >> "$REPORT_FILE"
  echo "Relationships are valid." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "RESULT=PASS" >> "$REPORT_FILE"
else
  echo "## Result" >> "$REPORT_FILE"
  echo "Relationship validation failed." >> "$REPORT_FILE"
  echo "" >> "$REPORT_FILE"
  echo "RESULT=FAIL" >> "$REPORT_FILE"
fi

cat "$REPORT_FILE"
