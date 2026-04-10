# Business Framework

## Purpose

This folder defines the reusable business-thinking layer of `server-10-applications`.

It exists so tenant applications are not built only as isolated folders, but can instead draw from a shared business structure.

The business framework is not itself a tenant.

It is the reusable business understanding layer that helps the application plane describe, compare, review, and later govern business surfaces with more discipline.

## Main Structure

### `foundations/`
This contains the main business-understanding surfaces.

It is where the framework explains the business through:

- business model structure
- canvases
- perspectives

These are the main ways of understanding what a business is.

### `expression/`
This contains the business-expression surfaces.

It is where the framework explains how business meaning is communicated outward.

At present this mainly includes communications, but it may later expand to include other expression forms such as narrative or positioning.

### `governance/`
This contains the business-framework control surfaces.

It is where the framework defines things such as:

- minimum business definition
- completeness rules
- readiness rules
- comparison basis
- summary discipline
- promotion candidate thinking

This area helps make the framework readable by the Service Availability Matrix later.

### `templates/`
This contains reusable starting forms, blank structures, or scaffolds for future business-framework work.

## Relationship to the Rest of Server-10

The business framework is one of the main reusable business surfaces inside `server-10-applications`.

It sits alongside:

- tenant application spaces in `apps/`
- governance and comparison logic in `service-availability-matrix/`
- policies, intake, flows, and interfaces that help connect the business plane to the broader constellation

## Final Principle

The business framework should stay reusable, disciplined, and understandable.

It should not become a mixed folder of unrelated notes.

This folder exists so business meaning can grow in a structured way before it is carried into tenant applications and later evaluated by the Service Availability Matrix.
