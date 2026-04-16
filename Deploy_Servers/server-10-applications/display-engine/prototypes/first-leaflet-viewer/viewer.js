function getBasemapConfig(basemap) {
  const basemapName =
    typeof basemap === "string" ? basemap : (basemap?.name || "osm");

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

    // Support new schema structure first, fallback to old structure if needed
    const identity = config.identity || {};
    const mapConfig = config.map || {};
    const basemapConfig = config.basemap || "osm";
    const layers = config.layers || [];
    const interaction = config.interaction || {};
    const widgets = config.widgets || {};

    const basemap = getBasemapConfig(basemapConfig);

    // Update title
    const title = identity.title || config.title || document.title;
    document.title = title;

    const heading = document.querySelector("#header h1");
    if (heading && title) {
      heading.textContent = title;
    }

    statusEl.textContent = config.statusLoadingMessage || "Loading GeoJSON...";

    // Create map
    const center = mapConfig.center || [9.0225, 38.7470];
    const zoom = mapConfig.zoom || 16;
    const maxZoom = mapConfig.maxZoom || 22;

    const map = L.map("map").setView(center, zoom);

    // Add basemap
    L.tileLayer(basemap.url, {
      maxZoom,
      attribution: basemap.attribution || ""
    }).addTo(map);

    // For now, use the first visible layer
    const activeLayer =
      layers.find((layer) => layer.visible !== false) || layers[0];

    if (!activeLayer) {
      throw new Error("No layer defined in profile.");
    }

    if (activeLayer.type !== "geojson") {
      throw new Error(`Unsupported layer type: ${activeLayer.type}`);
    }

    // Load GeoJSON
    const geoJsonResponse = await fetch(activeLayer.source);
    if (!geoJsonResponse.ok) {
      throw new Error(`Failed to load GeoJSON: ${geoJsonResponse.status}`);
    }

    const geoJsonData = await geoJsonResponse.json();

    const popupFields =
      activeLayer.popupFields ||
      interaction.popupFields ||
      config.popupFields ||
      [];

    // Create layer
    let geoJsonLayer = L.geoJSON(geoJsonData, {
      onEachFeature: (feature, leafletLayer) => {
        const props = feature.properties || {};

        const popupHtml = popupFields
          .map((field) => {
            const value = props[field] ?? "n/a";
            return `<strong>${field}:</strong> ${value}`;
          })
          .join("<br>");

        if (popupHtml) {
          leafletLayer.bindPopup(popupHtml);
        }
      }
    }).addTo(map);

    // Layer toggle
    const toggle = document.getElementById("layerToggle");

    if (toggle) {
      // Respect widget config if later you want to disable the toggle
      if (widgets.layerToggle === false) {
        toggle.checked = true;
        toggle.disabled = true;
      }

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
