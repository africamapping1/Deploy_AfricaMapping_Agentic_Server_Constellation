#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
TENANT_DIR="$BASE/tenants/realestate-ai"
FLOW_DIR="$TENANT_DIR/flows/flow-03"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
OUTPUT_FILE="$OUTPUT_DIR/realestate-analysis.md"

mkdir -p "$OUTPUT_DIR"

LATEST_PROJECT="$(find "$FLOW_DIR" -maxdepth 1 -type f -name '*-processed.txt' | sort | tail -n 1 || true)"

if [ -z "${LATEST_PROJECT:-}" ]; then
  cat > "$OUTPUT_FILE" <<EOF
# RealEstate AI Analysis

Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')

No processed real estate project found.
EOF
  echo "[strategist] real estate analysis written to $OUTPUT_FILE"
  cat "$OUTPUT_FILE"
  exit 0
fi

project_id=$(grep '^project_id=' "$LATEST_PROJECT" | head -n 1 | cut -d '=' -f2-)
name=$(grep '^name=' "$LATEST_PROJECT" | head -n 1 | cut -d '=' -f2-)
price=$(grep '^price=' "$LATEST_PROJECT" | head -n 1 | cut -d '=' -f2-)
expected_rent=$(grep '^expected_rent=' "$LATEST_PROJECT" | head -n 1 | cut -d '=' -f2-)
status=$(grep '^status=' "$LATEST_PROJECT" | tail -n 1 | cut -d '=' -f2-)

price=${price:-0}
expected_rent=${expected_rent:-0}

annual_rent=$((expected_rent * 12))

roi_percent="0.00"
if [ "$price" -gt 0 ]; then
  roi_percent=$(awk "BEGIN { printf \"%.2f\", ($annual_rent / $price) * 100 }")
fi

risk_score="medium"
recommendation="HOLD FOR REVIEW"

roi_check=$(awk "BEGIN { if ($roi_percent >= 8.0) print 1; else print 0 }")
if [ "$roi_check" -eq 1 ]; then
  risk_score="low"
  recommendation="GOOD CANDIDATE"
else
  roi_mid=$(awk "BEGIN { if ($roi_percent >= 5.0) print 1; else print 0 }")
  if [ "$roi_mid" -eq 1 ]; then
    risk_score="medium"
    recommendation="MODERATE POTENTIAL"
  else
    risk_score="high"
    recommendation="NOT RECOMMENDED"
  fi
fi

cat > "$OUTPUT_FILE" <<EOF
# RealEstate AI Analysis

Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')

## Property
Project ID: $project_id
Name: $name
Status: $status

## Financial Inputs
Price: $price
Expected Monthly Rent: $expected_rent
Expected Annual Rent: $annual_rent

## Analysis
Estimated ROI: $roi_percent%
Risk Score: $risk_score
Recommendation: $recommendation

## Strategist Interpretation
This property was evaluated using a simple rent-to-price heuristic.
The recommendation should be refined later with expenses, taxes, vacancy, financing, and local risk data.
EOF

echo "[strategist] real estate analysis written to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
