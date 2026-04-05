#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANTS_DIR="$BASE/tenants"
OUTPUT_DIR="$BASE/business"
OUTPUT="$OUTPUT_DIR/latest-summary.md"

mkdir -p "$OUTPUT_DIR"

echo "# Business Summary" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Generated at $(date -u '+%Y-%m-%dT%H:%M:%SZ')" >> "$OUTPUT"
echo "" >> "$OUTPUT"

########################################
# PROJECTS
########################################

echo "## Active Projects" >> "$OUTPUT"
echo "" >> "$OUTPUT"

FOUND_PROJECTS=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  TENANT_NAME="$(basename "$TENANT_PATH")"
  FLOW03_DIR="$TENANT_PATH/flows/flow-03"

  PROJECT_FILES=$(find "$FLOW03_DIR" -maxdepth 1 -type f -name 'project-*-processed.txt' | sort 2>/dev/null || true)

  if [ -n "$PROJECT_FILES" ]; then
    echo "### Tenant: $TENANT_NAME" >> "$OUTPUT"
    echo "" >> "$OUTPUT"

    while IFS= read -r PROJECT_FILE; do
      [ -n "$PROJECT_FILE" ] || continue
      [ -f "$PROJECT_FILE" ] || continue

      FOUND_PROJECTS=1

      PROJECT_NAME=$(grep "^name=" "$PROJECT_FILE" | head -n 1 | cut -d '=' -f2-)
      PROJECT_STATUS=$(grep "^status=" "$PROJECT_FILE" | tail -n 1 | cut -d '=' -f2-)
      PROJECT_UPDATED=$(grep "^processed_at=" "$PROJECT_FILE" | tail -n 1 | cut -d '=' -f2-)
      PROJECT_ID=$(grep "^project_id=" "$PROJECT_FILE" | head -n 1 | cut -d '=' -f2-)

      echo "#### $PROJECT_ID" >> "$OUTPUT"
      echo "" >> "$OUTPUT"
      echo "- Name: $PROJECT_NAME" >> "$OUTPUT"
      echo "- Status: $PROJECT_STATUS" >> "$OUTPUT"
      echo "- Last Updated: $PROJECT_UPDATED" >> "$OUTPUT"
      echo "" >> "$OUTPUT"
    done <<< "$PROJECT_FILES"
  fi
done

if [ "$FOUND_PROJECTS" -eq 0 ]; then
  echo "No active project data found." >> "$OUTPUT"
  echo "" >> "$OUTPUT"
fi

########################################
# PROGRAMS
########################################

echo "## Active Programs" >> "$OUTPUT"
echo "" >> "$OUTPUT"

FOUND_PROGRAMS=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  TENANT_NAME="$(basename "$TENANT_PATH")"
  PROGRAM_FILE="$TENANT_PATH/flows/flow-04/program-processed.txt"

  if [ -f "$PROGRAM_FILE" ]; then
    FOUND_PROGRAMS=1

    echo "### Tenant: $TENANT_NAME" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "#### Program Details" >> "$OUTPUT"
    echo "" >> "$OUTPUT"

    PROGRAM_ID=$(grep "^program_id=" "$PROGRAM_FILE" | head -n 1 | cut -d '=' -f2-)
    PROGRAM_NAME=$(grep "^name=" "$PROGRAM_FILE" | head -n 1 | cut -d '=' -f2-)
    PROGRAM_STATUS=$(grep "^status=" "$PROGRAM_FILE" | tail -n 1 | cut -d '=' -f2-)
    PROGRAM_UPDATED=$(grep "^processed_at=" "$PROGRAM_FILE" | tail -n 1 | cut -d '=' -f2-)

    echo "- Program ID: $PROGRAM_ID" >> "$OUTPUT"
    echo "- Name: $PROGRAM_NAME" >> "$OUTPUT"
    echo "- Status: $PROGRAM_STATUS" >> "$OUTPUT"
    echo "- Last Updated: $PROGRAM_UPDATED" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "#### Related Projects" >> "$OUTPUT"
    echo "" >> "$OUTPUT"

    RELATED_PROJECTS=$(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$PROGRAM_FILE")

    if [ -n "$RELATED_PROJECTS" ]; then
      while IFS= read -r project_id; do
        [ -n "$project_id" ] || continue
        echo "- $project_id" >> "$OUTPUT"
      done <<< "$RELATED_PROJECTS"
    else
      echo "No related projects listed." >> "$OUTPUT"
    fi

    echo "" >> "$OUTPUT"
  fi
done

if [ "$FOUND_PROGRAMS" -eq 0 ]; then
  echo "No active program data found." >> "$OUTPUT"
  echo "" >> "$OUTPUT"
fi

########################################
# ACTIVITIES
########################################

echo "## Recent Activities" >> "$OUTPUT"
echo "" >> "$OUTPUT"

FOUND_ACTIVITIES=0

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  TENANT_NAME="$(basename "$TENANT_PATH")"
  ACTIVITY_FILE="$TENANT_PATH/flows/flow-02/activity-processed.txt"

  if [ ! -f "$ACTIVITY_FILE" ]; then
    ACTIVITY_FILE="$TENANT_PATH/flows/flow-02/activity.txt"
  fi

  if [ -f "$ACTIVITY_FILE" ]; then
    FOUND_ACTIVITIES=1

    ACTIVITY_TITLE=$(grep "^title=" "$ACTIVITY_FILE" | head -n 1 | cut -d '=' -f2-)
    ACTIVITY_TYPE=$(grep "^type=" "$ACTIVITY_FILE" | head -n 1 | cut -d '=' -f2-)
    ACTIVITY_STATUS=$(grep "^status=" "$ACTIVITY_FILE" | tail -n 1 | cut -d '=' -f2-)

    echo "### Tenant: $TENANT_NAME" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "- Title: $ACTIVITY_TITLE" >> "$OUTPUT"
    echo "- Type: $ACTIVITY_TYPE" >> "$OUTPUT"
    echo "- Status: $ACTIVITY_STATUS" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  fi
done

if [ "$FOUND_ACTIVITIES" -eq 0 ]; then
  echo "No recent activities found." >> "$OUTPUT"
  echo "" >> "$OUTPUT"
fi

########################################
# FINAL NOTE
########################################

echo "## Business Interpretation" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The businesses are operational with tenant-specific active projects and coordinated programs." >> "$OUTPUT"
