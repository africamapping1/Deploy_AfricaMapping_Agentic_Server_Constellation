#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard"
OUT_FILE="$OUT_DIR/realestate-ai-dashboard.json"

STATE_FILE="$BASE/deployment-state/constellation-status.json"
GOV_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governor/decisions/latest-decision.md"
INFRA_FILE="$BASE/infrastructure/latest-health.txt"
HEALTH_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/governance-loop/latest-health.md"
REALESTATE_PORTFOLIO_FILE="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/realestate-portfolio-analysis.md"

TENANT_DIR="$BASE/tenants/realestate-ai"
FLOW03="$TENANT_DIR/flows/flow-03"
FLOW04="$TENANT_DIR/flows/flow-04"

mkdir -p "$OUT_DIR"

heartbeat_state="unknown"
if [ -f "$STATE_FILE" ]; then
  heartbeat_state=$(grep '"heartbeat_state"' "$STATE_FILE" | head -n 1 | sed 's/.*"heartbeat_state": "\(.*\)",*/\1/')
fi

governance_health="unknown"
if [ -f "$HEALTH_FILE" ] && grep -q "healthy" "$HEALTH_FILE"; then
  governance_health="healthy"
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

projects_json=""
programs_json=""
project_count=0
program_count=0
first_project=true
first_program=true

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

project_price=$(grep '^price=' "$f" | head -n 1 | cut -d '=' -f2-)
project_expected_rent=$(grep '^expected_rent=' "$f" | head -n 1 | cut -d '=' -f2-)
project_address=$(grep '^address=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
project_city=$(grep '^city=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
project_state=$(grep '^state=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')

project_price=${project_price:-0}
project_expected_rent=${project_expected_rent:-0}

project_annual_rent=$((project_expected_rent * 12))
project_roi="0.00"
if [ "$project_price" -gt 0 ]; then
  project_roi=$(awk "BEGIN { printf \"%.2f\", ($project_annual_rent / $project_price) * 100 }")
fi

projects_json+="
    {
      \"id\": \"$project_id\",
      \"name\": \"$project_name\",
      \"address\": \"$project_address\",
      \"city\": \"$project_city\",
      \"state\": \"$project_state\",
      \"status\": \"$project_status\",
      \"value\": $project_price,
      \"monthly_income\": $project_expected_rent,
      \"annual_income\": $project_annual_rent,
      \"estimated_roi\": $project_roi
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

realestate_total_properties=0
realestate_average_roi="0.00"
realestate_portfolio_risk="unknown"
realestate_recommendation="unknown"
realestate_best_opportunity=""
realestate_lowest_yield=""
realestate_portfolio_value=0
realestate_monthly_income=0
realestate_annual_income=0
realestate_estimated_yield_percent="0.00"
realestate_performance_trend="stable"
realestate_occupancy_status="unknown"

if [ -f "$REALESTATE_PORTFOLIO_FILE" ]; then
  realestate_total_properties=$(grep '^Total Properties:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs || echo 0)
  realestate_average_roi=$(grep '^Average ROI:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | tr -d '%' | xargs || echo "0.00")
  realestate_portfolio_risk=$(grep '^Portfolio Risk:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs || echo "unknown")
  realestate_recommendation=$(grep '^Recommendation:' "$REALESTATE_PORTFOLIO_FILE" | head -n 1 | cut -d ':' -f2- | xargs | sed 's/"/\\"/g' || echo "unknown")
  realestate_best_opportunity=$(awk '/## Best Opportunity/{getline; print; exit}' "$REALESTATE_PORTFOLIO_FILE" | sed 's/"/\\"/g')
  realestate_lowest_yield=$(awk '/## Lowest Yield/{getline; print; exit}' "$REALESTATE_PORTFOLIO_FILE" | sed 's/"/\\"/g')
fi

if [ -d "$FLOW03" ]; then
  total_price=0
  total_expected_rent=0
  property_count=0

  for f in "$FLOW03"/*-processed.txt; do
    [ -f "$f" ] || continue

    price=$(grep '^price=' "$f" | head -n 1 | cut -d '=' -f2-)
    expected_rent=$(grep '^expected_rent=' "$f" | head -n 1 | cut -d '=' -f2-)

    price=${price:-0}
    expected_rent=${expected_rent:-0}

    total_price=$((total_price + price))
    total_expected_rent=$((total_expected_rent + expected_rent))
    property_count=$((property_count + 1))
  done

  realestate_portfolio_value=$total_price
  realestate_monthly_income=$total_expected_rent
  realestate_annual_income=$((total_expected_rent * 12))

  if [ "$total_price" -gt 0 ]; then
    realestate_estimated_yield_percent=$(awk "BEGIN { printf \"%.2f\", ($realestate_annual_income / $total_price) * 100 }")
  fi

  trend_check=$(awk "BEGIN { if ($realestate_estimated_yield_percent >= 7.0) print 1; else print 0 }")
  if [ "$trend_check" -eq 1 ]; then
    realestate_performance_trend="up"
  else
    realestate_performance_trend="stable"
  fi

  if [ "$property_count" -gt 0 ]; then
    realestate_occupancy_status="occupied-assumed"
  fi
fi

cat > "$OUT_FILE" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "tenant": "realestate-ai",
  "platform": {
    "heartbeat_state": "$heartbeat_state",
    "governance_health": "$governance_health"
  },
  "portfolio": {
    "property_count": $realestate_total_properties,
    "portfolio_value": $realestate_portfolio_value,
    "monthly_income": $realestate_monthly_income,
    "annual_income": $realestate_annual_income,
    "average_roi": $realestate_average_roi,
    "estimated_yield_percent": $realestate_estimated_yield_percent,
    "risk": "$realestate_portfolio_risk",
    "trend": "$realestate_performance_trend",
    "occupancy_status": "$realestate_occupancy_status",
    "recommendation": "$realestate_recommendation",
    "best_opportunity": "$realestate_best_opportunity",
    "lowest_yield": "$realestate_lowest_yield"
  },
  "properties": [${projects_json}
  ],
  "portfolio_groups": [${programs_json}
  ],
  "governor": {
    "decision": "$governor_decision"
  },
  "infrastructure": {
    "restart_required": $restart_required,
    "gpu": "$gpu_status"
  }
}
EOFJSON

echo "[dashboard] realestate tenant JSON written to $OUT_FILE"
cat "$OUT_FILE"
