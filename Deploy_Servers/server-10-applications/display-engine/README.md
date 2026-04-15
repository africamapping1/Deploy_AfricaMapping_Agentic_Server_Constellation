# Display Engine

## Purpose

This folder defines the reusable GIS display engine of the platform.

It exists so GIS-related projects do not build one-off map viewers each time, but instead reuse a common display capability that can be configured for different products, tenants, and workflows.

The display engine is intended to support both:

- manual human-controlled display configuration
- later AI-assisted or AI-driven display configuration

## Main Idea

The display engine provides a reusable viewing and interaction layer for GIS outputs.

Instead of treating display as a final isolated page, this engine treats display as a reusable system capability with:

- shared state
- reusable views
- reusable controllers
- configurable profiles
- dashboard-driven setup for manual users

## Design Style

The display engine should follow an MVC-style structure where practical.

### Models
Models represent display-related state, such as:

- map state
- zoom state
- center / extent
- selected layers
- coordinate system
- transformation settings
- selection state
- 2D / 3D mode
- profile state

### Views
Views represent visible display surfaces, such as:

- 2D map view
- future 3D scene view
- layer list
- legend
- coordinate readout
- status bar
- manual configuration panels

### Controllers
Controllers manage interactions and display behavior, such as:

- zoom / pan / navigation
- basemap switching
- layer visibility
- feature selection
- coordinate assignment
- coordinate transformation
- profile application

## Manual Dashboard Role

The display engine should include a dashboard or configuration surface for manual users.

This exists so human users can configure display behavior without relying on AI.

Manual users should eventually be able to configure things such as:

- basemap choice
- visible layers
- startup center and zoom
- 2D / 3D mode
- coordinate system
- transformation behavior
- widget visibility
- display profile selection

## Reusability Rule

The display engine should be reusable across:

- AfricaMapping
- future GIS tenants
- future domain-specific projects
- later API-driven display services

It should not be tightly bound to one tenant or one static viewer.

## Relationship to Other Platform Areas

- `gis-framework/` defines reusable GIS capability families
- `display-engine/` defines reusable GIS viewing and interaction capability
- `apps/<tenant>/` consumes display capabilities for tenant products
- `asc/` may later route display configuration work
- `server-07-ai-orchestrator/` may later support AI-assisted display setup

## Folder Roles

### `core/`
Shared engine lifecycle and common internal rules.

### `models/`
Display-related state models.

### `views/`
Reusable visual display surfaces.

### `controllers/`
Reusable control logic for map behavior and interactions.

### `dashboard/`
Manual user configuration surfaces.

### `widgets/`
Reusable UI pieces such as zoom tools, coordinate readout, layer switchers, and scale displays.

### `profiles/`
Reusable display configurations and presets.

### `adapters/`
Connections to display technologies or ecosystems such as Leaflet, ArcGIS, Cesium, or future OSDU-related adapters.

### `services/`
Support services such as configuration loading, layer loading, and transformation helpers.

### `prototypes/`
Early working examples that help evolve the engine into reusable form.

## Initial MVP

The first MVP of the display engine should support:

- 2D map display
- one or more basemap choices
- loading a GeoJSON layer
- zoom and pan
- simple layer visibility control
- coordinate/status display
- a small dashboard for manual configuration

## Evolution Path

The current `first-map-viewer` should be treated as an early prototype.

The engine should evolve from:

```text
simple viewer
→ reusable prototype
→ configurable engine
→ profile-based display system
→ future display marketplace / API-driven display service
