# Addresses Program

## 1. Overview

The Addresses program is a composite GIS program that consumes:

- the display engine
- foundational spatial programs (buildings, land cover, water)

It provides structured address-related spatial outputs.

---

## 2. Purpose

The program aims to:

- represent address locations spatially
- associate addresses with buildings
- support navigation, search, and mapping use cases

---

## 3. Dependencies

### Display Engine
Provides:
- rendering
- interaction
- configuration

### Foundational Programs
- Buildings (primary)
- Land Cover (context)
- Water (context)

---

## 4. Outputs

- address points (GeoJSON)
- address-to-building relationships (future)
- display-ready layers

---

## 5. Current Stage

Stage 1:

- simple GeoJSON address points
- display through display engine

Future stages:

- geocoding
- validation
- enrichment
- linking to buildings

---

## 6. Relationship

Display Engine
    ↓
Foundational Programs (Buildings, Land Cover, Water)
    ↓
Addresses Program
