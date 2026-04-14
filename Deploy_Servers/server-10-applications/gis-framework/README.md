# GIS Framework

## Purpose

This folder defines the reusable GIS capability framework used by the platform.

It exists so GIS-related products are not built as isolated technical tasks only, but as a structured set of capabilities that can be interpreted through the business framework, evaluated by the Service Availability Matrix, and later executed through ASC.

## Main Idea

The GIS framework breaks a GIS product into reusable capability areas.

These capability areas can then be:

- understood technically
- mapped through the business canvas
- represented as runs in Jira
- handed to execution later

## Core Capability Areas

### `imagery-acquisition/`
This capability area covers how the system finds, selects, evaluates, and brings imagery into the wider workflow.

### `digitization-methods/`
This capability area covers how imagery or other source data is transformed into structured mapping outputs such as features.

### `feature-generation/`
This capability area covers the creation of structured geospatial features from source data.

This may include:

- polygons (land cover, water bodies, buildings)
- lines (roads, boundaries)
- points (locations, markers)
- classified raster outputs

The focus of this capability is transforming raw or intermediate data into usable geospatial features.

### `data-storage/`
This capability area covers where GIS outputs are stored, versioned, organized, and prepared for later use.

### `visualization/`
This capability area covers how GIS outputs are displayed, delivered, and made visible to users or systems.

## Relationship to the Run System

The run system uses these capability areas one at a time.

That means the platform can take one GIS capability and pass it through the business canvas before execution begins.

Example:

- Run-1 → imagery-acquisition × business canvas
- Run-2 → digitization-methods × business canvas
- Run-3 → feature-generation × business canvas
- Run-4 → data-storage × business canvas
- Run-5 → visualization × business canvas

## Relationship to the Wider Platform

- business-framework defines reusable business meaning
- gis-framework defines reusable GIS capability areas
- run-system connects GIS capabilities to business meaning
- service-availability-matrix evaluates readiness and strength
- ASC can later govern and execute clarified work

## Final Principle

The GIS framework should define reusable capability families, not only one-off project tasks.

This folder exists so GIS work can be understood, repeated, and improved over time.
