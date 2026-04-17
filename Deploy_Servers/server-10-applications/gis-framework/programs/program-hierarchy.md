# GIS Program Hierarchy

## 1. Overview

The GIS system is structured into three layers:

1. Display Engine (base capability)
2. Foundational Spatial Programs
3. Composite / Consumer Programs

This structure ensures reuse, consistency, and scalability across all GIS applications.

---

## 2. Display Engine

The display engine provides:

- map rendering (2D / later 3D)
- layer stacking
- styling
- interaction (zoom, pan, selection)
- UI controls (opacity, ordering, visibility)

It does not contain domain logic.

It is a shared display substrate for all GIS programs.

---

## 3. Foundational Spatial Programs

These programs generate reusable spatial layers.

### Current foundational programs:

- Water
- Land Cover
- Buildings

### Characteristics:

- Consume the display engine
- Produce standardized GeoJSON layers
- Can be used independently
- Serve as base inputs for higher-level programs

### Usage examples:

- environmental analysis
- soil studies
- development studies
- planning
- mapping products

---

## 4. Composite / Consumer Programs

These programs build on foundational programs.

### Example:

- Addresses

### Characteristics:

- Consume foundational layers (e.g., buildings)
- Add domain-specific logic
- Produce higher-level GIS products

### Future examples:

- Soil Analysis
- Environmental Monitoring
- Urban Planning
- Site Suitability

---

## 5. Relationship Model

Display Engine
    ↓
Foundational Programs (Water, Land Cover, Buildings)
    ↓
Composite Programs (Addresses, Studies, Planning)

---

## 6. Key Principle

Foundational programs are NOT created for a single use case.

They are reusable spatial assets that support multiple downstream programs.

---

## 7. Implication for Development

- Display Engine evolves independently
- Foundational programs are stabilized early
- Composite programs build on stable foundations

This ensures long-term scalability of the GIS platform.
