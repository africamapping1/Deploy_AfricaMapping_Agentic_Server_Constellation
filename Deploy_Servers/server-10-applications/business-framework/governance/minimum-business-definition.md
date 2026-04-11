# Minimum Business Definition

## Purpose

This file defines the minimum business information that should exist before a business surface is treated as meaningfully present inside `server-10-applications`.

It exists so the platform can distinguish between:

- a named business placeholder
- and a minimally defined business surface

This is the minimum-definition layer of the business-framework governance branch.

## Why This Exists

A business area can appear to exist because a folder, README, or title is present.

That is not enough.

For the platform to reason about a business, compare it, review it, or later govern it through the Service Availability Matrix, the business must meet a minimum level of definition.

## Minimum Required Business Elements

A business surface should normally define at least:

### 1. Identity
The business should state:

- what it is called
- what kind of business or service it is
- whether it is mainly internal, external, or mixed

### 2. Purpose
The business should explain:

- why it exists
- what need it is trying to serve
- what role it plays in the wider application plane

### 3. Primary Value
The business should identify:

- what value it provides
- what it makes easier, better, safer, faster, clearer, or more available

### 4. Primary Stakeholders
The business should identify:

- who it serves
- who it depends on
- who interacts with it directly

### 5. Core Surface
The business should identify its main operating surface.

Examples may include:

- website
- service
- platform module
- advisory function
- internal operations function
- data or geospatial surface

### 6. Structural Placement
The business should indicate:

- where it belongs in the application plane
- how it relates to the framework
- whether it is reusable, tenant-specific, or both

## Minimum Interpretation Rule

A business surface that lacks several of the elements above may still be interesting, but it should be treated as:

- early
- partial
- not yet ready for strong comparison or review

## Important Note

The minimum definition is not the full business model.

It is the threshold at which the platform can say:

> this business now exists as a meaningful surface rather than as a name only

## Final Principle

A business must be minimally defined before it can be evaluated well.

This file exists so business presence starts with real meaning.
