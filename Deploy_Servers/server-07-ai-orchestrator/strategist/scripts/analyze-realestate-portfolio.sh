#!/usr/bin/env bash
set -euo pipefail

BASE="/opt/africamapping"
FLOW_DIR="$BASE/tenants/realestate-ai/flows/flow-03"
OUTPUT_DIR="$BASE/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs"
OUTPUT_FILE="$OUTPUT_DIR/realestate-portfolio-analysis.md"

mkdir -p "$OUTPUT_DIR"

total_properties=0
total_roi=0
best_project=""
best_roi=-1
worst_project=""
worst_roi=999999
portfolio_risk="medium"

details=""

for FILE in "$FLOW_DIR"/*-processed.txt; do
  [ -f "$FILE" ] || continue

  project_id=$(grep '^project_id=' "$FILE" | head -n 1 | cut -d '=' -f2-)
  name=$(grep '^name=' "$FILE" | head -n 1 | cut -d '=' -f2-)
  price=$(grep '^price=' "$FILE" | head -n 1 | cut -d '=' -f2-)
  expected_rent=$(grep '^expected_rent=' "$FILE" | head -n 1 | cut -d '=' -f2-)

  price=${price:-0}
  expected_rent=${expected_rent:-0}
  annual_rent=$((expected_rent * 12))

  roi_percent="0.00"
  if [ "$price" -gt 0 ]; then
    roi_percent=$(awk "BEGIN { printf \"%.2f\", ($annual_rent / $price) * 100 }")
  fi

  total_properties=$((total_properties + 1))
  total_roi=$(awk "BEGIN { printf \"%.2f\", $total_roi + $roi_percent }")

  better=$(awk "BEGIN { if ($roi_percent > $best_roi) print 1; else print 0 }")
  if [ "$better" -eq 1 ]; then
    best_roi="$roi_percent"
    best_project="$project_id ($name)"
  fi

  worse=$(awk "BEGIN { if ($roi_percent < $worst_roi) print 1; else print 0 }")
  if [ "$worse" -eq 1 ]; then
    worst_roi="$roi_percent"
    worst_project="$project_id ($name)"
  fi

  details="${details}- ${project_id}: ${name} → ROI ${roi_percent}%\n"
done

if [ "$total_properties" -eq 0 ]; then
  cat > "$OUTPUT_FILE" <<EOF
# RealEstate AI Portfolio Analysis

Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')

No processed real estate projects found.
EOF
  echo "[strategist] real estate portfolio analysis written to $OUTPUT_FILE"
  cat "$OUTPUT_FILE"
  exit 0
fi

average_roi=$(awk "BEGIN { printf \"%.2f\", $total_roi / $total_properties }")

high=$(awk "BEGIN { if ($average_roi >= 8.0) print 1; else print 0 }")
low=$(awk "BEGIN { if ($average_roi < 5.0) print 1; else print 0 }")

if [ "$high" -eq 1 ]; then
  portfolio_risk="low"
  recommendation="STRONG PORTFOLIO POTENTIAL"
elif [ "$low" -eq 1 ]; then
  portfolio_risk="high"
  recommendation="WEAK PORTFOLIO - REVIEW CAREFULLY"
else
  portfolio_risk="medium"
  recommendation="SELECTIVE POTENTIAL"
fi

cat > "$OUTPUT_FILE" <<EOF
# RealEstate AI Portfolio Analysis

Generated at: $(date -u '+%Y-%m-%dT%H:%M:%SZ')

## Portfolio Summary
Total Properties: $total_properties
Average ROI: $average_roi%
Portfolio Risk: $portfolio_risk
Recommendation: $recommendation

## Best Opportunity
$best_project → $best_roi%

## Lowest Yield
$worst_project → $worst_roi%

## Property Breakdown
$(printf "%b" "$details")

## Strategist Interpretation
This portfolio view is based on simple rent-to-price ROI estimates.
Future versions should include expenses, taxes, financing, vacancy, market trends, and local risk overlays.
EOF

echo "[strategist] real estate portfolio analysis written to $OUTPUT_FILE"
cat "$OUTPUT_FILE"
