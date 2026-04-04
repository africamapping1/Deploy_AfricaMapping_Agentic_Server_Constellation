#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
APP_DIR="$BASE/Deploy_Servers/server-10-applications/apps/realestate-ai"
EMPLOYEE_FILE="$APP_DIR/users/employees/employee-001.txt"
MAPPING_FILE="$APP_DIR/users/access/mappings/employee-001.txt"
OUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/dashboard/employees"
OUT_FILE="$OUT_DIR/employee-001-dashboard.json"

FLOW03="$BASE/tenants/realestate-ai/flows/flow-03"
FLOW04="$BASE/tenants/realestate-ai/flows/flow-04"
CUSTOMERS_DIR="$APP_DIR/users/customers"

mkdir -p "$OUT_DIR"

employee_id=$(grep '^employee_id=' "$EMPLOYEE_FILE" | head -n 1 | cut -d '=' -f2-)
employee_name=$(grep '^name=' "$EMPLOYEE_FILE" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
employee_title=$(grep '^title=' "$EMPLOYEE_FILE" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
tenant=$(grep '^tenant=' "$EMPLOYEE_FILE" | head -n 1 | cut -d '=' -f2-)

allowed_customers=()
while IFS= read -r ref; do
  [ -n "$ref" ] || continue
  allowed_customers+=("$ref")
done < <(awk '/^customers:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$MAPPING_FILE")

allowed_projects=()
while IFS= read -r ref; do
  [ -n "$ref" ] || continue
  allowed_projects+=("$ref")
done < <(awk '/^projects:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$MAPPING_FILE")

allowed_programs=()
while IFS= read -r ref; do
  [ -n "$ref" ] || continue
  allowed_programs+=("$ref")
done < <(awk '/^programs:/{flag=1; next} flag && /^- /{print substr($0,3)} flag && !/^- / && NF{flag=0}' "$MAPPING_FILE")

customers_json=""
first_customer=true
for customer_ref in "${allowed_customers[@]}"; do
  file="$CUSTOMERS_DIR/${customer_ref}.txt"
  [ -f "$file" ] || continue

  name=$(grep '^name=' "$file" | head -n 1 | cut -d '=' -f2- | sed 's/"/\\"/g')
  status=$(grep '^status=' "$file" | head -n 1 | cut -d '=' -f2-)

  if [ "$first_customer" = true ]; then
    first_customer=false
  else
    customers_json+=","
  fi

  customers_json+="
    {
      \"customer_id\": \"$customer_ref\",
      \"name\": \"$name\",
      \"status\": \"$status\"
    }"
done

properties_json=""
portfolio_groups_json=""
alerts_json=""
first_property=true
first_group=true
first_alert=true

portfolio_value=0
monthly_income=0
annual_income=0
property_count=0
roi_sum="0.00"
underperforming_count=0

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

  low=$(awk "BEGIN { if ($roi < 7.0) print 1; else print 0 }")
  if [ "$low" -eq 1 ]; then
    underperforming_count=$((underperforming_count + 1))
    if [ "$first_alert" = true ]; then
      first_alert=false
    else
      alerts_json+=","
    fi
    alerts_json+="
    {
      \"type\": \"underperforming_asset\",
      \"property_id\": \"$project_id\",
      \"message\": \"$name is below target ROI at ${roi}%\"
    }"
  fi

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

cat > "$OUT_FILE" <<EOFJSON
{
  "generated_at": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "tenant": "$tenant",
  "user": {
    "employee_id": "$employee_id",
    "name": "$employee_name",
    "role": "employee",
    "title": "$employee_title"
  },
  "managed_customers": [${customers_json}
  ],
  "portfolio_summary": {
    "property_count": $property_count,
    "portfolio_value": $portfolio_value,
    "monthly_income": $monthly_income,
    "annual_income": $annual_income,
    "average_roi": $average_roi,
    "estimated_yield_percent": $estimated_yield_percent,
    "underperforming_assets": $underperforming_count
  },
  "managed_properties": [${properties_json}
  ],
  "portfolio_groups": [${portfolio_groups_json}
  ],
  "alerts": [${alerts_json}
  ]
}
EOFJSON

echo "[dashboard] employee dashboard written to $OUT_FILE"
cat "$OUT_FILE"
