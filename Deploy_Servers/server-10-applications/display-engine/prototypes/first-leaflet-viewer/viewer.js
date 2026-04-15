function getBasemapConfig(basemapName) {
  if (basemapName === "carto-light") {
    return {
      url: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
      attribution: "&copy; OpenStreetMap contributors &copy; CARTO"
    };
  }

  return {
    url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    attribution: "&copy; OpenStreetMap contributors"
  };
}

async function loadViewer() {
  const statusEl = document.getElementById("status");

  try {
    statusEl.textContent = "Loading configuration...";

    const configResponse = await fetch("./config.json");
    if (!configResponse.ok) {
      throw new Error(`Failed to load config.json: ${configResponse.status}`);
    }

    const config = await configResponse.json();
    const params = new URLSearchParams(window.location.search);

    const title = params.get("title") || config.title;
    const lat = parseFloat(params.get("lat") || config.map.center[0]);
    const lon = parseFloat(params.get("lon") || config.map.center[1]);
    const zoom = parseInt(params.get("zoom") || config.map.zoom, 10);
    const basemapName = params.get("basemap") || "osm";
    const geoJsonUrl = params.get("geojson") || config.data.geoJsonUrl;

    const basemap = getBasemapConfig(basemapName);

    document.title = title || document.title;
    const heading = document.querySelector("#header h1");
    if (heading && title) heading.textContent = title;

    statusEl.textContent = config.statusLoadingMessage || "Loading GeoJSON...";

    const map = L.map("map").setView([lat, lon], zoom);

    L.tileLayer(basemap.url, {
      maxZoom: config.map.maxZoom || 22,
      attribution: basemap.attribution || ""
    }).addTo(map);

    const geoJsonResponse = await fetch(geoJsonUrl);
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
