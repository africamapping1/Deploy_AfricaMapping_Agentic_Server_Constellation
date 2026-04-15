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

    const params = new URLSearchParams(window.location.search);
    const profileUrl = params.get("profile");

    let config;

    // Load profile if provided, otherwise fallback to config.json
    if (profileUrl) {
      const response = await fetch(profileUrl);
      if (!response.ok) {
        throw new Error(`Failed to load profile: ${response.status}`);
      }
      config = await response.json();
    } else {
      const configResponse = await fetch("./config.json");
      if (!configResponse.ok) {
        throw new Error(`Failed to load config.json: ${configResponse.status}`);
      }
      config = await configResponse.json();
    }

    const basemap = getBasemapConfig(config.basemap || "osm");

    // Update title
    document.title = config.title || document.title;
    const heading = document.querySelector("#header h1");
    if (heading && config.title) {
      heading.textContent = config.title;
    }

    statusEl.textContent = config.statusLoadingMessage || "Loading GeoJSON...";

    // Create map
    const map = L.map("map").setView(
      config.map.center,
      config.map.zoom
    );

    // Add basemap
    L.tileLayer(basemap.url, {
      maxZoom: config.map.maxZoom || 22,
      attribution: basemap.attribution || ""
    }).addTo(map);

    // Load GeoJSON
    const geoJsonResponse = await fetch(config.data.geoJsonUrl);
    if (!geoJsonResponse.ok) {
      throw new Error(`Failed to load GeoJSON: ${geoJsonResponse.status}`);
    }

    const geoJsonData = await geoJsonResponse.json();

    // Create layer
    let geoJsonLayer = L.geoJSON(geoJsonData, {
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

    // Layer toggle
    const toggle = document.getElementById("layerToggle");

    if (toggle) {
      toggle.addEventListener("change", () => {
        if (toggle.checked) {
          geoJsonLayer.addTo(map);
        } else {
          map.removeLayer(geoJsonLayer);
        }
      });
    }

    // Fit map to bounds
    if (geoJsonLayer.getBounds && geoJsonLayer.getBounds().isValid()) {
      map.fitBounds(geoJsonLayer.getBounds(), { padding: [20, 20] });
    }

    statusEl.textContent =
      config.statusReadyMessage || "GeoJSON loaded successfully.";

  } catch (error) {
    console.error(error);
    if (statusEl) {
      statusEl.textContent = `Error: ${error.message}`;
    }
  }
}

loadViewer();
