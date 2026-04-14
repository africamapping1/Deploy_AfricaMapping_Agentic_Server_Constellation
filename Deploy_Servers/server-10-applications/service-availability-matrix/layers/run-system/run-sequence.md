# Run Sequence

## Purpose

This file defines the normal sequence of runs for a GIS product capability chain.

It exists so the platform moves through capability interpretation in an ordered way and stays explicitly connected to the GIS framework.

## Standard Sequence

### Run-0
Pure business definitions only.

Reference:
- `business-framework/`

### Run-1
Imagery acquisition × business canvas.

Reference:
- `gis-framework/imagery-acquisition/`

### Run-2
Digitization methods × business canvas.

Reference:
- `gis-framework/digitization-methods/`

### Run-3
Feature generation × business canvas.

Reference:
- `gis-framework/feature-generation/`

### Run-4
Data storage × business canvas.

Reference:
- `gis-framework/data-storage/`

### Run-5
Visualization × business canvas.

Reference:
- `gis-framework/visualization/`

## Meaning of the Sequence

The sequence is designed to move from upstream capability to downstream delivery.

This helps the platform understand:

- what enters the system
- how it is transformed
- where it is stored
- how it is seen

It also helps keep each run grounded in one reusable GIS capability family.

## Final State

When all runs are complete, the platform should have:

- a clarified business meaning for each capability
- a clearer overall system direction
- a stronger basis for ASC execution planning
- a stronger basis for Jira run representation

## Final Principle

The run sequence should move through the capability chain in a deliberate order and remain explicitly anchored to reusable GIS capability families.
