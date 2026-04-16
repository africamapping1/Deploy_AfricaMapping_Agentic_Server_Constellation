function getBasemapConfig(basemap) {
  const basemapName =
    typeof basemap === "string" ? basemap : (basemap?.name || "osm");

  if (basemapName === "carto-light") {
    return {
      name: "carto-light",
      label: "Carto Light",
      url: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
      attribution: "&copy; OpenStreetMap contributors &copy; CARTO"
    };
  }

  return {
    name: "osm",
    label: "OpenStreetMap",
    url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
    attribution: "&copy; OpenStreetMap contributors"
  };
}

function updateText(id, value) {
  const el = document.getElementById(id);
  if (el) el.textContent = value;
}

async function loadViewer() {
  const statusEl = document.getElementById("status");

  try {
    statusEl.textContent = "Loading configuration...";

    const params = new URLSearchParams(window.location.search);
    const profileUrl = params.get("profile");

    let config;

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

    const identity = config.identity || {};
    const mapConfig = config.map || {};
    const basemapConfig = config.basemap || "osm";
    const layers = config.layers || [];
    const interaction = config.interaction || {};
    const widgets = config.widgets || {};

    const startingBasemap = getBasemapConfig(basemapConfig);

    const title = identity.title || config.title || document.title;
    document.title = title;

    const heading = document.querySelector("#header h1");
    if (heading && title) {
      heading.textContent = title;
    }

    statusEl.textContent = config.statusLoadingMessage || "Loading GeoJSON...";

    const center = mapConfig.center || [9.0225, 38.7470];
    const zoom = mapConfig.zoom || 16;
    const maxZoom = mapConfig.maxZoom || 22;

    const map = L.map("map").setView(center, zoom);

    let basemapLayer = L.tileLayer(startingBasemap.url, {
      maxZoom,
      attribution: startingBasemap.attribution || ""
    }).addTo(map);

    updateText("basemapReadout", startingBasemap.label);

    const activeLayer =
      layers.find((layer) => layer.visible !== false) || layers[0];

    if (!activeLayer) {
      throw new Error("No layer defined in profile.");
    }

    if (activeLayer.type !== "geojson") {
      throw new Error(`Unsupported layer type: ${activeLayer.type}`);
    }

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

    updateText("layerReadout", `${activeLayer.name} (on)`);

    const toggle = document.getElementById("layerToggle");

    if (toggle) {
      if (widgets.layerToggle === false) {
        toggle.checked = true;
        toggle.disabled = true;
      }

      toggle.addEventListener("change", () => {
        if (toggle.checked) {
          geoJsonLayer.addTo(map);
          updateText("layerReadout", `${activeLayer.name} (on)`);
        } else {
          map.removeLayer(geoJsonLayer);
          updateText("layerReadout", `${activeLayer.name} (off)`);
        }
      });
    }

    const basemapSelect = document.getElementById("basemapSelect");

    if (basemapSelect) {
      basemapSelect.value = startingBasemap.name;

      basemapSelect.addEventListener("change", () => {
        const nextBasemap = getBasemapConfig(basemapSelect.value);

        map.removeLayer(basemapLayer);

        basemapLayer = L.tileLayer(nextBasemap.url, {
          maxZoom,
          attribution: nextBasemap.attribution || ""
        }).addTo(map);

        updateText("basemapReadout", nextBasemap.label);
      });
    }

    map.on("mousemove", (e) => {
      const lat = e.latlng.lat.toFixed(5);
      const lng = e.latlng.lng.toFixed(5);
      updateText("coordReadout", `${lat}, ${lng}`);
    });

    map.on("mouseout", () => {
      updateText("coordReadout", "--, --");
    });

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
