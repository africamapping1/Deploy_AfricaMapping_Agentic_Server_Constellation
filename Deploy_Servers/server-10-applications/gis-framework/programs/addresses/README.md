# Addresses Program

## 1. Overview

The Addresses program is a composite GIS program that consumes:

- the display engine
- foundational spatial programs, especially buildings

It produces address-related spatial outputs that can later support search, navigation, geocoding, and administrative workflows.

---

## 2. Purpose

The program aims to:

- represent addresses spatially as points
- relate addresses to buildings
- provide display-ready address layers
- prepare for later address intelligence workflows

---

## 3. Dependencies

### Display Engine
Provides:
- rendering
- interaction
- profile-driven display
- layer controls

### Foundational Programs
- Buildings (primary dependency)
- Land Cover (context)
- Water (context)

---

## 4. Current Output

Current stage output includes:

- address points
- `building_id` linkage to buildings
- display-ready GeoJSON

---

## 5. Current Relationship Model

The current model is simple:

```text
address point
    ↓
building_id reference
    ↓
building layer
