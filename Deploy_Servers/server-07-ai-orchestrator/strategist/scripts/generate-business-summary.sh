#!/bin/bash

OUTPUT="/opt/africamapping/business/latest-summary.md"

mkdir -p /opt/africamapping/business

echo "# Business Summary" > "$OUTPUT"
echo "" >> "$OUTPUT"
echo "Generated at $(date -u)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

########################################
# PROJECTS
########################################

echo "## Active Projects" >> "$OUTPUT"
echo "" >> "$OUTPUT"

PROJECT_FILE="/opt/africamapping/flows/flow-03/project-processed.txt"

if [ -f "$PROJECT_FILE" ]; then
  echo "### Project Details" >> "$OUTPUT"
  echo "" >> "$OUTPUT"

  PROJECT_NAME=$(grep "^name=" "$PROJECT_FILE" | cut -d '=' -f2-)
  PROJECT_STATUS=$(grep "^status=" "$PROJECT_FILE" | tail -n 1 | cut -d '=' -f2-)
  PROJECT_UPDATED=$(grep "^processed_at=" "$PROJECT_FILE" | tail -n 1 | cut -d '=' -f2-)

  echo "- Name: $PROJECT_NAME" >> "$OUTPUT"
  echo "- Status: $PROJECT_STATUS" >> "$OUTPUT"
  echo "- Last Updated: $PROJECT_UPDATED" >> "$OUTPUT"
else
  echo "No active project data found." >> "$OUTPUT"
fi

echo "" >> "$OUTPUT"

########################################
# PROGRAMS
########################################

echo "## Active Programs" >> "$OUTPUT"
echo "" >> "$OUTPUT"

PROGRAM_FILE="/opt/africamapping/flows/flow-04/program-processed.txt"

if [ -f "$PROGRAM_FILE" ]; then
  echo "### Program Details" >> "$OUTPUT"
  echo "" >> "$OUTPUT"

  PROGRAM_NAME=$(grep "^name=" "$PROGRAM_FILE" | cut -d '=' -f2-)
  PROGRAM_STATUS=$(grep "^status=" "$PROGRAM_FILE" | tail -n 1 | cut -d '=' -f2-)
  PROGRAM_UPDATED=$(grep "^processed_at=" "$PROGRAM_FILE" | tail -n 1 | cut -d '=' -f2-)

  echo "- Name: $PROGRAM_NAME" >> "$OUTPUT"
  echo "- Status: $PROGRAM_STATUS" >> "$OUTPUT"
  echo "- Last Updated: $PROGRAM_UPDATED" >> "$OUTPUT"

  echo "" >> "$OUTPUT"
  echo "### Related Projects" >> "$OUTPUT"
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
else
  echo "No active program data found." >> "$OUTPUT"
fi

echo "" >> "$OUTPUT"

########################################
# ACTIVITIES
########################################

echo "## Recent Activities" >> "$OUTPUT"
echo "" >> "$OUTPUT"

ACTIVITY_FILE="/opt/africamapping/flows/flow-02/activity-processed.txt"
if [ ! -f "$ACTIVITY_FILE" ]; then
  ACTIVITY_FILE="/opt/africamapping/flows/flow-02/activity.txt"
fi

if [ -f "$ACTIVITY_FILE" ]; then
  ACTIVITY_TITLE=$(grep "^title=" "$ACTIVITY_FILE" | cut -d '=' -f2-)
  ACTIVITY_TYPE=$(grep "^type=" "$ACTIVITY_FILE" | cut -d '=' -f2-)
  ACTIVITY_STATUS=$(grep "^status=" "$ACTIVITY_FILE" | tail -n 1 | cut -d '=' -f2-)

  echo "- Title: $ACTIVITY_TITLE" >> "$OUTPUT"
  echo "- Type: $ACTIVITY_TYPE" >> "$OUTPUT"
  echo "- Status: $ACTIVITY_STATUS" >> "$OUTPUT"
else
  echo "No recent activities found." >> "$OUTPUT"
fi

echo "" >> "$OUTPUT"

########################################
# FINAL NOTE
########################################

echo "## Business Interpretation" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The business is operational with active projects and coordinated programs." >> "$OUTPUT"
