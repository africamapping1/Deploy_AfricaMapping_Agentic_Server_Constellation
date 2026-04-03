#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"
OUT_FILE="$OUT_DIR/latest-dashboard.json"

STATE_FILE="$BASE/deployment-state/constellation-status.json"
REL_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/relationship-validation.md"
GOV_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
INFRA_FILE="$BASE/infrastructure/latest-health.txt"
REALESTATE_PORTFOLIO_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/realestate-portfolio-analysis.md"
HEALTH_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/latest-health.md"
TENANTS_DIR="$BASE/tenants"

mkdir -p "$OUT_DIR"

heartbeat_state="unknown"
if [ -f "$STATE_FILE" ]; then
  heartbeat_state=$(grep '"heartbeat_state"' "$STATE_FILE" | head -n 1 | sed 's/.*"heartbeat_state": "\(.*\)",*/\1/')
fi

governance_health="unknown"
if [ -f "$HEALTH_FILE" ] && grep -q "healthy" "$HEALTH_FILE"; then
  governance_health="healthy"
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
gpu_status="unknown"
if [ -f "$INFRA_FILE" ]; then
  if grep -q "No restart required." "$INFRA_FILE"; then
    restart_required="false"
  elif grep -q "System restart is required." "$INFRA_FILE"; then
    restart_required="true"
  fi

  if grep -q "No GPU detected." "$INFRA_FILE"; then
    gpu_status="none"
  else
    gpu_status="present"
  fi
fi

realestate_total_properties=0
realestate_average_roi="0.00"
realestate_portfolio_risk="unknown"
realestate_recommendation="unknown"
realestate_best_opportunity=""
realestate_lowest_yield=""

projects_json=""
programs_json=""
project_count=0
program_count=0
alerts_json=""
first_project=true
first_program=true

for TENANT_PATH in "$TENANTS_DIR"/*; do
  [ -d "$TENANT_PATH" ] || continue

  FLOW03="$TENANT_PATH/flows/flow-03"
  FLOW04="$TENANT_PATH/flows/flow-04"

  for f in "$FLOW03"/*-processed.txt; do
    [ -f "$f" ] || continue

    project_id=$(grep '^project_id=' "$f" | head -n 1 | cut -d '=' -f2-)
    project_name=$(grep '^name=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
    project_status=$(grep '^status=' "$f" | tail -n 1 | cut -d '=' -f2-)

    project_count=$((project_count+1))

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

  for f in "$FLOW04"/*-processed.txt; do
    [ -f "$f" ] || continue

    program_id=$(grep '^program_id=' "$f" | head -n 1 | cut -d '=' -f2-)
    program_name=$(grep '^name=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
    program_status=$(grep '^status=' "$f" | tail -n 1 | cut -d '=' -f2-)

    program_projects_json=""
    first_prog_project=true
    while IFS= read -r project_ref; do
      [ -n "$project_ref" ] || continue
      if [ "$first_prog_project" = true ]; then
        first_prog_project=false
      else
        program_projects_json+=", "
      fi
      program_projects_json+="\"$project_ref\""
    done < <(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$f")

    program_count=$((program_count+1))

    if [ "$first_program" = true ]; then
      first_program=false
    else
      programs_json+=","
    fi

    programs_json+="
    {
      \"id\": \"$program_id\",
      \"name\": \"$program_name\",
      \"status\": \"$program_status\",
      \"projects\": [${program_projects_json}]
    }"
  done
done

if [ "$validation_result" != "PASS" ]; then
  alerts_json="\"Program-project relationship issue detected\""
fi

if [ -f "$REALESTATE_PORTFOLIO_FILE" ]; then
  realestate_total_properties=$(grep '^Total Properties:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs || echo 0)
  realestate_average_roi=$(grep '^Average ROI:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | tr -d '%' | xargs || echo "0.00")
  realestate_portfolio_risk=$(grep '^Portfolio Risk:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs || echo "unknown")
  realestate_recommendation=$(grep '^Recommendation:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs | sed 's/"/\\"/g' || echo "unknown")
  realestate_best_opportunity=$(awk '/## Best Opportunity/{getline; print; exit}' "$REALESTATE_PORTFOLIO_FILE" | sed 's/"/\\"/g')
  realestate_lowest_yield=$(awk '/## Lowest Yield/{getline; print; exit}' "$REALESTATE_PORTFOLIO_FILE" | sed 's/"/\\"/g')
fi

cat > "$OUT_FILE" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "platform": {
    "heartbeat_state": "$heartbeat_state",
    "governance_health": "$governance_health"
  },
  "metrics": {
    "projects": $project_count,
    "programs": $program_count
  },
  "alerts": [${alerts_json}],

  "projects": [${projects_json}
  ],
  "programs": [${programs_json}
  ],

  "realestate": {
    "total_properties": $realestate_total_properties,
    "average_roi": $realestate_average_roi,
    "portfolio_risk": "$realestate_portfolio_risk",
    "recommendation": "$realestate_recommendation",
    "best_opportunity": "$realestate_best_opportunity",
    "lowest_yield": "$realestate_lowest_yield"
  },

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
