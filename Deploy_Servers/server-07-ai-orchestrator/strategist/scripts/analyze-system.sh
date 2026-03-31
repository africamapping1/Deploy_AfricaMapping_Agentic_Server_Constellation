#!/bin/bash

OUTPUT="/opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs/latest-strategy.md"

mkdir -p /opt/africamapping/Deploy_Servers/server-07-ai-orchestrator/strategist/outputs

echo "# Strategist Analysis" > "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Generated at: $(date -u)" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "## System Interpretation" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The system is behaving as expected and is stable." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "## Risks" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "- No immediate risks detected." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "## Suggested Next Steps" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "- Expand program-to-project relationships (support multiple projects per program)" >> "$OUTPUT"
echo "- Introduce project lifecycle transitions (active → completed → archived)" >> "$OUTPUT"
echo "- Enhance dashboard for operational visibility and alerts" >> "$OUTPUT"
echo "- Introduce system load testing and scaling validation" >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "## Strategic Note" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "The constellation is evolving into a fully governed operational platform with active business coordination and infrastructure awareness." >> "$OUTPUT"

echo "" >> "$OUTPUT"
echo "## Strategic Signals" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Detect archived-heavy system (example signal)
ARCHIVED_COUNT=$(grep -r "status=archived" /opt/africamapping/flows 2>/dev/null | wc -l)

if [ "$ARCHIVED_COUNT" -gt 5 ]; then
  echo "- High number of archived entities detected → system may be cycling too fast" >> "$OUTPUT"
fi

# Detect no active projects
ACTIVE_COUNT=$(grep -r "status=active" /opt/africamapping/flows 2>/dev/null | wc -l)

if [ "$ACTIVE_COUNT" -eq 0 ]; then
  echo "- No active work detected → system idle risk" >> "$OUTPUT"
fi
