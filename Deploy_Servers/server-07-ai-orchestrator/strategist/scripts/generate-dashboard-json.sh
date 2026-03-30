#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"
OUT_FILE="$OUT_DIR/latest-dashboard.json"

STATE_FILE="$BASE/deployment-state/constellation-status.json"
REL_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
GOV_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
INFRA_FILE="$BASE/infrastructure/latest-health.txt"
PROJECT_DIR="$BASE/flows/flow-03"
PROGRAM_FILE="$BASE/flows/flow-04/program-processed.txt"
HEALTH_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/latest-health.md"

mkdir -p "$OUT_DIR"

heartbeat_state="unknown"
if [ -f "$STATE_FILE" ]; then
  heartbeat_state=$(grep '"heartbeat_state"' "$STATE_FILE" | head -n 1 | sed 's/.*"heartbeat_state": "\(.*\)",*/\1/')
fi

governance_health="unknown"
if [ -f "$HEALTH_FILE" ]; then
  if grep -q "healthy" "$HEALTH_FILE"; then
    governance_health="healthy"
  fi
fi

validation_result="unknown"
if [ -f "$REL_FILE" ]; then
  validation_result=$(grep '^RESULT=' "$REL_FILE" | tail -n 1 | cut -d '=' -f2-)
fi

governor_decision="unknown"
if [ -f "$GOV_FILE" ]; then
  governor_decision=$(awk '/## Decision/{getline; getline; print; exit}' "$GOV_FILE" | sed 's/"/\\"/g')
fi

restart_required="unknown"
gpu_status="unknown
"

PROJECT_COUNT=$(find "$PROJECT_DIR" -maxdepth 1 -type f -name 'project-*-processed.txt' | wc -l | tr -d ' ')
PROGRAM_COUNT=0
if [ -f "$PROGRAM_FILE" ]; then
  PROGRAM_COUNT=1
fi

ALERTS_JSON=""
if [ "$validation_result" != "PASS" ]; then
  ALERTS_JSON="\"Program-project relationship issue detected\""
fi


if [ -f "$INFRA_FILE" ]; then
  if grep -q "System restart is required." "$INFRA_FILE"; then
    restart_required="true"
  else
    restart_required="false"
  fi

  if grep -q "No GPU detected." "$INFRA_FILE"; then
    gpu_status="none"
  else
    gpu_status="present"
  fi
fi

projects_json=""
first_project=true
for f in "$PROJECT_DIR"/project-*-processed.txt; do
  [ -e "$f" ] || continue

  project_id=$(grep '^project_id=' "$f" | head -n 1 | cut -d '=' -f2-)
  project_name=$(grep '^name=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  project_status=$(grep '^status=' "$f" | tail -n 1 | cut -d '=' -f2-)

  if [ "$first_project" = true ]; then
    first_project=false
  else
    projects_json+=","
  fi

  projects_json+="
    {
      \"id\": \"$project_id\",
      \"name\": \"$project_name\",
      \"status\": \"$project_status\"
    }"
done

program_id=""
program_name=""
program_status=""
program_projects_json=""

if [ -f "$PROGRAM_FILE" ]; then
  program_id=$(grep '^program_id=' "$PROGRAM_FILE" | head -n 1 | cut -d '=' -f2-)
  program_name=$(grep '^name=' "$PROGRAM_FILE" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  program_status=$(grep '^status=' "$PROGRAM_FILE" | tail -n 1 | cut -d '=' -f2-)

  first_prog_project=true
  while IFS= read -r project_ref; do
    [ -n "$project_ref" ] || continue
    if [ "$first_prog_project" = true ]; then
      first_prog_project=false
    else
      program_projects_json+=", "
    fi
    program_projects_json+="\"$project_ref\""
  done < <(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$PROGRAM_FILE")
fi

cat > "$OUT_FILE" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "platform": {
    "heartbeat_state": "$heartbeat_state",
    "governance_health": "$governance_health"
  },

  "metrics": {
    "projects": $PROJECT_COUNT,
    "programs": $PROGRAM_COUNT
  },
  "alerts": [${ALERTS_JSON}],

  "projects": [${projects_json}
  ],
  "programs": [
    {
      "id": "$program_id",
      "name": "$program_name",
      "status": "$program_status",
      "projects": [${program_projects_json}]
    }
  ],
  "validation": {
    "result": "$validation_result"
  },
  "governor": {
    "decision": "$governor_decision"
  },
  "infrastructure": {
    "restart_required": $restart_required,
    "gpu": "$gpu_status"
  }
}
EOFJSON

echo "[dashboard] JSON written to $OUT_FILE"
cat "$OUT_FILE"
