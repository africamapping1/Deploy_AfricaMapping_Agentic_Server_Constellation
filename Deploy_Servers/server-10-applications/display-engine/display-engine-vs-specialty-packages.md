# Display Engine vs Specialty Packages

## Purpose

This file clarifies the separation between:

- the display engine (base system)
- specialty GIS packages (domain-specific capabilities)

It uses a concrete example:

Water, Land Cover, and Building Digitization (AI + Human-assisted)

---

## Core Principle

The display engine is the shared display substrate.

Specialty packages attach to it and provide domain-specific tools.

Projects use both together.

---

## System Layers

### 1. Display Engine (Base Layer)

Provides:

- map canvas
- basemap management
- zoom / pan / navigation
- coordinate readout
- scale bar
- layer visibility control
- profile-based configuration
- shared UI shell
- status and interaction surface

The display engine does NOT perform GIS work.

It only provides the environment where GIS work happens.

---

### 2. Specialty Packages (GIS Capability Layer)

Provide:

- domain-specific tools
- workflows
- data logic
- analysis or editing capability

Examples:

- water extraction tools
- land cover classification tools
- building digitization tools
- geodatabase browsing tools
- parcel editing tools

These packages plug into the display engine.

---

### 3. Project Layer (Work Layer)

Defines:

- real datasets
- real repositories
- real outputs
- workflows
- users

Example:

Water, Land Cover, and Building Digitization project.

---

## Example: Water, Land Cover, Building Digitization

### Step 1 — Display Engine Setup

The project is assigned a display profile:

```text
africamapping-digitization-profile
