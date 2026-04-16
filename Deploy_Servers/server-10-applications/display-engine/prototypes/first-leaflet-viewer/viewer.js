function getBasemapConfig(basemap) {
  const name =
    typeof basemap === "string" ? basemap : (basemap?.name || "osm");

  if (name === "carto-light") {
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

function applyOpacityToLayer(leafletLayer, opacity) {
  leafletLayer.eachLayer((child) => {
    if (child.setStyle) {
      child.setStyle({
        opacity,
        fillOpacity: Math.max(0.1, Math.min(opacity, 1))
      });
    }
  });
}

async function loadViewer() {
  const statusEl = document.getElementById("status");

  try {
    statusEl.textContent = "Loading configuration...";

    const params = new URLSearchParams(window.location.search);
    const profileUrl = params.get("profile");

    let config;

    if (profileUrl) {
      const res = await fetch(profileUrl);
      if (!res.ok) throw new Error(`Profile load failed: ${res.status}`);
      config = await res.json();
    } else {
      const res = await fetch("./config.json");
      if (!res.ok) throw new Error(`config.json load failed`);
      config = await res.json();
    }

    const identity = config.identity || {};
    const mapConfig = config.map || {};
    const basemapConfig = config.basemap || "osm";
    const projection = config.projection || {};
    const layers = config.layers || [];
    const interaction = config.interaction || {};
    const widgets = config.widgets || {};

    const title = identity.title || "Viewer";
    document.title = title;

    const heading = document.querySelector("#header h1");
    if (heading) heading.textContent = title;

    updateText("profileName", identity.name || "--");
    updateText("profileTitle", identity.title || "--");
    updateText("profileTenant", identity.tenant || "--");
    updateText("profileVersion", identity.version || "--");
    updateText("profileStatus", identity.status || "--");
    updateText("profileMode", mapConfig.mode || "--");
    updateText("profileProjection", projection.coordinateSystem || "--");

    const center = mapConfig.center || [9.0225, 38.7470];
    const zoom = mapConfig.zoom || 16;
    const maxZoom = mapConfig.maxZoom || 22;

    const map = L.map("map").setView(center, zoom);

    let basemapLayer;
    function applyBasemap(basemap) {
      const cfg = getBasemapConfig(basemap);

      if (basemapLayer) {
        map.removeLayer(basemapLayer);
      }

      basemapLayer = L.tileLayer(cfg.url, {
        maxZoom,
        attribution: cfg.attribution
      }).addTo(map);

      updateText("basemapReadout", cfg.label);
    }

    applyBasemap(basemapConfig);

    if (widgets.scaleBar !== false) {
      L.control.scale().addTo(map);
    }

    if (!layers.length) {
      throw new Error("No layers defined in profile.");
    }

    const layerControls = document.getElementById("layerControls");
    const layerInstances = [];

    function redrawLayerOrder() {
      layerInstances.forEach((entry) => {
        if (map.hasLayer(entry.layer)) {
          entry.layer.bringToFront();
        }
      });
    }

    function renderLayerControls() {
      if (!layerControls) return;
      layerControls.innerHTML = "";

      layerInstances.forEach((entry, index) => {
        const wrapper = document.createElement("div");
        wrapper.style.border = "1px solid #ddd";
        wrapper.style.padding = "8px";
        wrapper.style.marginBottom = "8px";
        wrapper.style.background = "#fff";

        const title = document.createElement("div");
        title.style.fontWeight = "600";
        title.style.marginBottom = "6px";
        title.textContent = entry.def.name;

        const toggleRow = document.createElement("div");
        toggleRow.style.marginBottom = "6px";

        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.checked = entry.visible;

        const label = document.createElement("label");
        label.textContent = " Visible";
        label.style.marginLeft = "4px";

        checkbox.addEventListener("change", () => {
          entry.visible = checkbox.checked;

          if (entry.visible) {
            entry.layer.addTo(map);
            redrawLayerOrder();
          } else {
            map.removeLayer(entry.layer);
          }

          updateText(
            "layerReadout",
            `${layerInstances.filter((x) => x.visible).length} / ${layerInstances.length} visible`
          );
        });

        toggleRow.appendChild(checkbox);
        toggleRow.appendChild(label);

        const opacityLabel = document.createElement("div");
        opacityLabel.style.fontSize = "12px";
        opacityLabel.style.marginBottom = "4px";
        opacityLabel.textContent = `Opacity: ${entry.opacity.toFixed(2)}`;

        const opacityInput = document.createElement("input");
        opacityInput.type = "range";
        opacityInput.min = "0";
        opacityInput.max = "1";
        opacityInput.step = "0.1";
        opacityInput.value = String(entry.opacity);
        opacityInput.style.width = "100%";
        opacityInput.style.marginBottom = "8px";

        opacityInput.addEventListener("input", () => {
          entry.opacity = parseFloat(opacityInput.value);
          opacityLabel.textContent = `Opacity: ${entry.opacity.toFixed(2)}`;
          applyOpacityToLayer(entry.layer, entry.opacity);
        });

        const orderRow = document.createElement("div");
        orderRow.style.display = "flex";
        orderRow.style.gap = "6px";

        const upBtn = document.createElement("button");
        upBtn.textContent = "Up";
        upBtn.style.flex = "1";

        const downBtn = document.createElement("button");
        downBtn.textContent = "Down";
        downBtn.style.flex = "1";

        upBtn.addEventListener("click", () => {
          if (index < layerInstances.length - 1) {
            const temp = layerInstances[index];
            layerInstances[index] = layerInstances[index + 1];
            layerInstances[index + 1] = temp;
            renderLayerControls();
            redrawLayerOrder();
          }
        });

        downBtn.addEventListener("click", () => {
          if (index > 0) {
            const temp = layerInstances[index];
            layerInstances[index] = layerInstances[index - 1];
            layerInstances[index - 1] = temp;
            renderLayerControls();
            redrawLayerOrder();
          }
        });

        orderRow.appendChild(upBtn);
        orderRow.appendChild(downBtn);

        wrapper.appendChild(title);
        wrapper.appendChild(toggleRow);
        wrapper.appendChild(opacityLabel);
        wrapper.appendChild(opacityInput);
        wrapper.appendChild(orderRow);

        layerControls.appendChild(wrapper);
      });
    }

    for (const layerDef of layers) {
      if (layerDef.type !== "geojson") {
        console.warn("Skipping unsupported layer:", layerDef.type);
        continue;
      }

      try {
        const res = await fetch(layerDef.source);
        if (!res.ok) throw new Error(`Failed: ${layerDef.name}`);

        const data = await res.json();

        const popupFields =
          layerDef.popupFields ||
          interaction.popupFields ||
          [];

        const leafletLayer = L.geoJSON(data, {
          onEachFeature: (feature, layer) => {
            const props = feature.properties || {};

            const html = popupFields
              .map((f) => `<strong>${f}:</strong> ${props[f] ?? "n/a"}`)
              .join("<br>");

            if (html) layer.bindPopup(html);
          }
        });

        const visible = layerDef.visible !== false;
        const opacity = typeof layerDef.opacity === "number" ? layerDef.opacity : 1;

        if (visible) {
          leafletLayer.addTo(map);
        }

        applyOpacityToLayer(leafletLayer, opacity);

        layerInstances.push({
          def: layerDef,
          layer: leafletLayer,
          visible,
          opacity
        });
      } catch (err) {
        console.error("Layer error:", layerDef.name, err);
      }
    }

    renderLayerControls();
    redrawLayerOrder();

    updateText(
      "layerReadout",
      `${layerInstances.filter((x) => x.visible).length} / ${layerInstances.length} visible`
    );

    const firstVisible = layerInstances.find((x) => x.visible)?.layer;
    if (firstVisible && firstVisible.getBounds().isValid()) {
      map.fitBounds(firstVisible.getBounds(), { padding: [20, 20] });
    }

    const basemapSelect = document.getElementById("basemapSelect");
    if (basemapSelect) {
      basemapSelect.value =
        typeof basemapConfig === "string"
          ? basemapConfig
          : basemapConfig.name;

      basemapSelect.addEventListener("change", () => {
        applyBasemap(basemapSelect.value);
      });
    }

    map.on("mousemove", (e) => {
      updateText(
        "coordReadout",
        `${e.latlng.lat.toFixed(5)}, ${e.latlng.lng.toFixed(5)}`
      );
    });

    map.on("mouseout", () => {
      updateText("coordReadout", "--, --");
    });

    statusEl.textContent = "GeoJSON loaded successfully.";
  } catch (err) {
    console.error(err);
    if (statusEl) statusEl.textContent = `Error: ${err.message}`;
  }
}

loadViewer();
