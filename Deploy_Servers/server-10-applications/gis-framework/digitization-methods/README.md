# Digitization Methods

## Purpose

This folder defines the reusable digitization-methods capability of the GIS framework.

It exists so the platform can treat the transformation of source data into structured geospatial features as a defined and repeatable capability.

Digitization methods are responsible for converting imagery or other source data into usable outputs such as polygons, lines, or points.

## Main Idea

Digitization methods cover how the system:

- interprets source data
- extracts meaningful features
- transforms raw inputs into structured geospatial outputs
- ensures consistency across outputs

This capability sits between imagery acquisition and feature generation.

## Why This Exists

Without defined digitization methods, projects may:

- produce inconsistent outputs
- rely on unclear or undocumented processes
- struggle to scale across regions
- fail to reproduce results

This folder exists so transformation logic becomes structured, comparable, and reusable.

## Core Questions

Digitization methods should help answer questions such as:

- how should features be extracted from source data
- what method is appropriate (manual, semi-automated, automated)
- what level of accuracy is required
- how should edge cases be handled
- how should consistency be maintained across regions
- how should outputs be validated

## Relationship to the Business Framework

Digitization methods should later be run through the business canvas to clarify:

- what value the transformation process provides
- who depends on the quality of extracted features
- what resources are required (tools, compute, expertise)
- what activities define the transformation process
- what trade-offs exist between cost and quality

## Relationship to the Run System

In the run system, digitization methods typically follow imagery acquisition:

- Run-1 → imagery acquisition × business canvas
- Run-2 → digitization methods × business canvas

This allows the platform to clarify how data will be transformed after it is acquired.

## Relationship to Other GIS Capabilities

Digitization methods connect:

- upstream: imagery acquisition
- downstream: feature generation

They define how raw data becomes structured inputs for later steps.

## Future Contents

This folder may later include:

- transformation approaches (manual vs automated)
- method comparison notes
- accuracy guidelines
- validation approaches
- tool selection patterns

## Final Principle

Digitization methods should be defined as reusable transformation logic, not as ad hoc processing steps.
