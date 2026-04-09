# Tenant Types

## Purpose

This layer defines how the platform should recognize meaningful tenant-type patterns across the application plane.

It exists so the platform can distinguish between different kinds of tenant businesses without forcing every tenant into one identical shape.

This is the tenant-type interpretation layer of the Service Availability Matrix.

## Why This Exists

The first modeled tenants already show that not all tenants grow in the same way.

For example, one tenant may be stronger in:

- role-based user surfaces
- dashboards
- customer and employee views
- investor-oriented communication

while another may be stronger in:

- stakeholder-facing communication
- broader service-module grouping
- operational coordination structures
- integration-oriented business areas

These are not necessarily inconsistencies.

They may reflect different tenant types.

This layer exists so those differences can become understandable rather than chaotic.

## Core Principle

Tenant parity does not require identical tenants.

It requires that tenant differences are visible, explainable, and governed.

Tenant types help the platform understand which differences are natural and which differences are accidental.

## What a Tenant Type Means

A tenant type is a recurring business/application pattern that influences:

- communication needs
- service surfaces
- business model emphasis
- onboarding defaults
- capability expectations
- future registration profiles

A tenant type is not a rigid category.

It is a working pattern that helps the platform reason more intelligently.

## Current Observed Tenant-Type Patterns

At this time, the platform is already beginning to observe at least two useful tenant-type patterns.

### 1. Role-Surface Tenant

This pattern is stronger where the tenant business depends heavily on distinct user roles and visible user-facing service surfaces.

Typical characteristics may include:

- customer-facing view
- employee-facing view
- dashboard emphasis
- user-interface presence
- role-aware communication needs
- clearer separation between customer and internal operator experience

Current example:
- `realestate-ai`

### 2. Stakeholder / Service-Module Tenant

This pattern is stronger where the tenant business depends more on broader operational grouping, external-facing business areas, and stakeholder-oriented structure.

Typical characteristics may include:

- stakeholder-facing communication
- service-module breadth
- operations emphasis
- integration-oriented grouping
- broader business-area organization
- less role-surface emphasis at the current stage

Current example:
- `africamapping`

## Why Tenant Types Matter

Tenant types help the platform answer questions such as:

- which communication baseline should apply
- which deeper pitch type is more relevant
- which service surfaces should be expected
- which modules are likely standard for this tenant pattern
- what onboarding defaults make sense
- what parity should mean for this class of tenant

Without tenant types, parity can become too rigid or too vague.

## Relationship to Registration Baseline

The registration baseline should define the minimum shared structure for all tenants.

Tenant types should then define the pattern-specific additions or emphasis.

That means future onboarding may look like:

- common baseline for all tenants
- tenant-type profile layered on top
- tenant-specific customization after that

## Relationship to Surfaces

Tenant types strongly affect surface expectations.

For example:

- a role-surface tenant may naturally require customer and employee surfaces
- a stakeholder/service-module tenant may naturally require partner, operations, or institutional-facing structures
- a hybrid tenant may require both

This means surface parity should be interpreted in light of tenant type.

## Relationship to Communications

Tenant types also affect communications expectations.

For example:

- a role-surface tenant may need investor pitch, customer story, and operator explanation sooner
- a stakeholder/service-module tenant may need stakeholder pitch, partner explanation, and strategic narrative sooner

The matrix should therefore compare comparable communication needs, not only identical file names.

## Relationship to Reusable Extraction

If multiple tenants begin to cluster into similar patterns, those patterns may become stronger reusable tenant-type profiles.

This can eventually support:

- onboarding templates
- capability bundles
- surface packages
- communication defaults
- future UI registration choices

## Possible Future Tenant-Type States

Over time, the platform may define clearer tenant types such as:

- role-surface tenant
- stakeholder/service-module tenant
- customer-service tenant
- institution-facing tenant
- integration-heavy tenant
- portfolio-intelligence tenant
- hybrid tenant

These are examples of future refinement, not fixed law.

## Current Caution

Tenant types should help interpretation, not become a trap.

They should not be used to freeze a tenant permanently into one rigid category.

A tenant may evolve from one type pattern toward another.

The platform should allow that evolution.

## Governance Value

A stronger tenant-type understanding makes it easier to:

- define onboarding defaults
- interpret parity fairly
- define reasonable capability expectations
- avoid accidental omissions
- evolve registration into a smarter governed flow

## Final Principle

Different tenants may be different for valid reasons.

This layer exists so the platform can understand those reasons and turn them into governed, reusable intelligence rather than unmanaged drift.
