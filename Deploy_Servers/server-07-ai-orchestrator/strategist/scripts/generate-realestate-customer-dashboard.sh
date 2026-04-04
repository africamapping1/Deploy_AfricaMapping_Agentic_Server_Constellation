#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
APP_DIR="$BASE/Deploy_Servers/server-10-applications/apps/realestate-ai"
CUSTOMER_FILE="$APP_DIR/users/customers/customer-001.txt"
MAPPING_FILE="$APP_DIR/users/access/mappings/customer-001.txt"
TENANT_DASHBOARD="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard/realestate-ai-dashboard.json"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard/customers"
OUT_FILE="$OUT_DIR/customer-001-dashboard.json"

mkdir -p "$OUT_DIR"

customer_id=$(grep '^customer_id=' "$CUSTOMER_FILE" | head -n 1 | cut -d '=' -f2-)
customer_name=$(grep '^name=' "$CUSTOMER_FILE" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
tenant=$(grep '^tenant=' "$CUSTOMER_FILE" | head -n 1 | cut -d '=' -f2-)

allowed_projects=()
while IFS= read -r project_ref; do
  [ -n "$project_ref" ] || continue
  allowed_projects+=("$project_ref")
done < <(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$MAPPING_FILE")

allowed_programs=()
while IFS= read -r program_ref; do
  [ -n "$program_ref" ] || continue
  allowed_programs+=("$program_ref")
done < <(awk '/^programs:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$MAPPING_FILE")

FLOW03="$BASE/tenants/realestate-ai/flows/flow-03"
FLOW04="$BASE/tenants/realestate-ai/flows/flow-04"

properties_json=""
portfolio_groups_json=""
first_property=true
first_group=true

portfolio_value=0
monthly_income=0
annual_income=0
property_count=0
roi_sum="0.00"

for f in "$FLOW03"/*-processed.txt; do
  [ -f "$f" ] || continue

  project_id=$(grep '^project_id=' "$f" | head -n 1 | cut -d '=' -f2-)

  include=false
  for allowed in "${allowed_projects[@]}"; do
    if [ "$project_id" = "$allowed" ]; then
      include=true
      break
    fi
  done

  [ "$include" = true ] || continue

  name=$(grep '^name=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  address=$(grep '^address=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  city=$(grep '^city=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  state=$(grep '^state=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  status=$(grep '^status=' "$f" | tail -n 1 | cut -d '=' -f2-)
  value=$(grep '^price=' "$f" | head -n 1 | cut -d '=' -f2-)
  monthly=$(grep '^expected_rent=' "$f" | head -n 1 | cut -d '=' -f2-)

  value=${value:-0}
  monthly=${monthly:-0}
  annual=$((monthly * 12))
  roi="0.00"
  if [ "$value" -gt 0 ]; then
    roi=$(awk "BEGIN { printf \"%.2f\", ($annual / $value) * 100 }")
  fi

  portfolio_value=$((portfolio_value + value))
  monthly_income=$((monthly_income + monthly))
  annual_income=$((annual_income + annual))
  property_count=$((property_count + 1))
  roi_sum=$(awk "BEGIN { printf \"%.2f\", $roi_sum + $roi }")

  if [ "$first_property" = true ]; then
    first_property=false
  else
    properties_json+=","
  fi

  properties_json+="
    {
      \"id\": \"$project_id\",
      \"name\": \"$name\",
      \"address\": \"$address\",
      \"city\": \"$city\",
      \"state\": \"$state\",
      \"status\": \"$status\",
      \"value\": $value,
      \"monthly_income\": $monthly,
      \"annual_income\": $annual,
      \"estimated_roi\": $roi
    }"
done

for f in "$FLOW04"/*-processed.txt; do
  [ -f "$f" ] || continue

  program_id=$(grep '^program_id=' "$f" | head -n 1 | cut -d '=' -f2-)

  include=false
  for allowed in "${allowed_programs[@]}"; do
    if [ "$program_id" = "$allowed" ]; then
      include=true
      break
    fi
  done

  [ "$include" = true ] || continue

  name=$(grep '^name=' "$f" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  status=$(grep '^status=' "$f" | tail -n 1 | cut -d '=' -f2-)

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

  if [ "$first_group" = true ]; then
    first_group=false
  else
    portfolio_groups_json+=","
  fi

  portfolio_groups_json+="
    {
      \"id\": \"$program_id\",
      \"name\": \"$name\",
      \"status\": \"$status\",
      \"projects\": [${program_projects_json}]
    }"
done

average_roi="0.00"
if [ "$property_count" -gt 0 ]; then
  average_roi=$(awk "BEGIN { printf \"%.2f\", $roi_sum / $property_count }")
fi

estimated_yield_percent="0.00"
if [ "$portfolio_value" -gt 0 ]; then
  estimated_yield_percent=$(awk "BEGIN { printf \"%.2f\", ($annual_income / $portfolio_value) * 100 }")
fi

risk="medium"
trend="stable"
recommendation="HOLD"

high=$(awk "BEGIN { if ($average_roi >= 8.0) print 1; else print 0 }")
mid=$(awk "BEGIN { if ($average_roi >= 6.0) print 1; else print 0 }")

if [ "$high" -eq 1 ]; then
  risk="low"
  trend="up"
  recommendation="STRONG POSITION"
elif [ "$mid" -eq 1 ]; then
  risk="medium"
  trend="up"
  recommendation="SELECTIVE POTENTIAL"
else
  risk="high"
  trend="stable"
  recommendation="REVIEW HOLDINGS"
fi

cat > "$OUT_FILE" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "tenant": "$tenant",
  "user": {
    "customer_id": "$customer_id",
    "name": "$customer_name",
    "role": "customer"
  },
  "portfolio": {
    "property_count": $property_count,
    "portfolio_value": $portfolio_value,
    "monthly_income": $monthly_income,
    "annual_income": $annual_income,
    "average_roi": $average_roi,
    "estimated_yield_percent": $estimated_yield_percent,
    "risk": "$risk",
    "trend": "$trend",
    "occupancy_status": "occupied-assumed",
    "recommendation": "$recommendation"
  },
  "properties": [${properties_json}
  ],
  "portfolio_groups": [${portfolio_groups_json}
  ]
}
EOFJSON

echo "[dashboard] customer dashboard written to $OUT_FILE"
cat "$OUT_FILE"
