# Tenant Business Minimums

## Purpose

This layer defines the minimum business-definition baseline that every tenant should be evaluated against.

It exists so the platform can answer a simple but important question:

Does this tenant have the minimum business structure required to be understandable, governable, and extendable?

This is the first baseline layer of the Service Availability Matrix.

## Why This Exists

Not every tenant needs the same advanced capabilities at the same time.

But every tenant should have a minimum business foundation.

Without that baseline, the tenant may exist technically while remaining weak in business clarity, communication readiness, and future reproducibility.

This layer helps the platform detect:

- missing foundations
- uneven tenant maturity
- accidental omissions
- patterns strong enough to become tenant standards

## Core Principle

A tenant should not be considered structurally mature if it lacks the minimum business-definition layer.

The goal is not perfection.

The goal is a clear minimum baseline.

## Minimum Baseline Items

At this time, the minimum business baseline should include at least the following items for each tenant:

### 1. Tenant README
The tenant should have a root tenant README.

This provides the first high-level description of the tenant application/business space.

### 2. Business README
The tenant should have a `business/README.md`.

This defines the tenant-specific business truth layer.

### 3. Business Model README
The tenant should have a `business/business-model/README.md`.

This defines the structural business model layer for the tenant.

### 4. Canvas Overview
The tenant should have a `business/canvas/overview.md`.

This defines the high-level painted business picture.

### 5. Communications README
The tenant should have a `business/communications/README.md`.

This defines the tenant-specific communication layer.

### 6. Strategy README
The tenant should have a `business/strategy/README.md`.

This defines the tenant’s directional and strategic layer.

## Why These Are the Minimum

These six items create a usable baseline because together they provide:

- identity
- business grounding
- structural model
- whole-business picture
- communication layer
- directional layer

Without these, the tenant is harder to understand, harder to mirror, and harder to grow in a controlled way.

## Matrix Status Guidance

Each item in this layer should eventually be assigned a status such as:

- missing
- placeholder
- scaffolded
- documented
- mature

For this first minimum layer, the most important question is whether the tenant has a real documented presence for each baseline item.

## Reproducibility Logic

If multiple tenants consistently contain the same minimum items, those items can be treated as part of the standard tenant business baseline.

This means the matrix is not only checking presence.

It is also learning what should become normal for future tenant creation.

## Comparison Rule

This layer should help compare tenants such as:

- `africamapping`
- `realestate-ai`
- future tenants

The comparison should not ask whether they are identical.

It should ask whether they are comparably grounded.

## Governance Value

A tenant that meets this minimum layer is easier to:

- govern
- explain
- extend
- compare
- onboard into future parity controls
- include in future business registration patterns

## Final Principle

The minimum business layer is the first threshold of tenant maturity.

A tenant may grow far beyond it.

But it should not fall below it.
