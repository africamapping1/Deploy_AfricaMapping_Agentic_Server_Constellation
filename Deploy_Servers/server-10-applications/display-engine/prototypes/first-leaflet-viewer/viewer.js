async function loadViewer() {
  const statusEl = document.getElementById("status");

  try {
    statusEl.textContent = "Loading configuration...";

    const configResponse = await fetch("./config.json");
    if (!configResponse.ok) {
      throw new Error(`Failed to load config.json: ${configResponse.status}`);
    }

    const config = await configResponse.json();

    document.title = config.title || document.title;
    statusEl.textContent = config.statusLoadingMessage || "Loading GeoJSON...";

    const map = L.map("map").setView(
      config.map.center,
      config.map.zoom
    );

    L.tileLayer(config.basemap.url, {
      maxZoom: config.map.maxZoom || 22,
      attribution: config.basemap.attribution || ""
    }).addTo(map);

    const geoJsonResponse = await fetch(config.data.geoJsonUrl);
    if (!geoJsonResponse.ok) {
      throw new Error(`Failed to load GeoJSON: ${geoJsonResponse.status}`);
    }

    const geoJsonData = await geoJsonResponse.json();

    const layer = L.geoJSON(geoJsonData, {
      onEachFeature: (feature, leafletLayer) => {
        const props = feature.properties || {};
        const popupFields = config.popupFields || [];

        const popupHtml = popupFields
          .map((field) => {
            const value = props[field] ?? "n/a";
            return `<strong>${field}:</strong> ${value}`;
          })
          .join("<br>");

        leafletLayer.bindPopup(popupHtml);
      }
    }).addTo(map);

    if (layer.getBounds && layer.getBounds().isValid()) {
      map.fitBounds(layer.getBounds(), { padding: [20, 20] });
    }

    statusEl.textContent =
      config.statusReadyMessage || "GeoJSON loaded successfully.";
  } catch (error) {
    console.error(error);
    statusEl.textContent = `Error: ${error.message}`;
  }
}

loadViewer();
