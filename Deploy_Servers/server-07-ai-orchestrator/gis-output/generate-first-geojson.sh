#!/bin/bash

echo "=== FIRST GIS OUTPUT START ==="

OUTPUT_DIR="/opt/africamapping/generated/maps"
OUTPUT_FILE="$OUTPUT_DIR/africamapping-first-polygon.geojson"

mkdir -p "$OUTPUT_DIR"

cat > "$OUTPUT_FILE" <<'EOF'
{
  "type": "FeatureCollection",
  "name": "africamapping-first-polygon",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "id": "polygon-001",
        "tenant": "africamapping",
        "layer": "buildings",
        "status": "demo"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [38.7465, 9.0220],
            [38.7475, 9.0220],
            [38.7475, 9.0230],
            [38.7465, 9.0230],
            [38.7465, 9.0220]
          ]
        ]
      }
    }
  ]
}
EOF

echo "GeoJSON written to: $OUTPUT_FILE"
echo "=== FIRST GIS OUTPUT END ==="
