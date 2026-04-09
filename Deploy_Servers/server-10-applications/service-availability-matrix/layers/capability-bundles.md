# Capability Bundles

## Purpose

This layer defines how the platform should group related services, structures, and business capabilities into reusable bundles.

It exists so the platform can move from isolated tenant-by-tenant additions toward more governed and repeatable service packaging.

This is the capability-bundle layer of the Service Availability Matrix.

## Why This Exists

As the platform grows, tenants will not only differ by single files or single services.

They will often need groups of related capabilities together.

For example, a tenant may not only need:

- a website
- a dashboard
- a communication file

It may need a coherent package such as:

- customer and employee role surfaces
- dashboard visibility
- communications baseline
- service-module grouping
- user-access structure

Without bundles, the platform risks tracking too many isolated items one by one.

With bundles, the platform can govern meaningful groups of capability together.

## Core Principle

A capability bundle is a reusable package of related tenant capabilities.

It should make onboarding, parity, and rollout easier.

Bundles do not replace detailed matrix tracking.

They organize it.

## What a Capability Bundle Can Include

A capability bundle may include combinations such as:

- business-definition structures
- communication structures
- role-based surfaces
- dashboard packages
- integration groups
- service-module groups
- onboarding defaults
- tenant-type specific service sets

The exact composition may vary by tenant type and maturity.

## Why Bundles Matter

Bundles help the platform answer questions such as:

- what should a new tenant receive by default
- which related services should roll out together
- which capabilities belong to a tenant-type profile
- what is missing as a package, not just as isolated files
- how can parity become more practical and less fragmented

## Example Bundle Types

### 1. Business Minimum Bundle

A possible baseline bundle for all tenants may include:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- elevator pitch
- one deeper audience-facing pitch

This would align with the current learned registration baseline.

### 2. Role-Surface Bundle

A possible bundle for role-surface tenants may include:

- user-interface presence
- customer surface
- employee surface
- customer dashboard
- employee dashboard
- role-aware communication support

This is currently suggested by the `realestate-ai` pattern.

### 3. Stakeholder / Service-Module Bundle

A possible bundle for stakeholder/service-module tenants may include:

- stakeholder-facing communication
- operations area
- service-module grouping
- broader integration areas
- partner or institutional explanation

This is currently suggested by the `africamapping` pattern.

### 4. Integration Bundle

A possible bundle may include grouped external business modules such as:

- CRM
- finance
- geospatial
- social or external communications
- user-access mappings

This kind of bundle may later become relevant for more advanced tenants.

## Maturity Logic

Useful bundle states may include:

- not defined
- draft
- observed pattern
- reusable candidate
- reusable bundle
- standard bundle
- registration default bundle

This helps the platform distinguish between an idea and a governed reusable package.

## Relationship to Tenant Types

Bundles should often be interpreted through tenant type.

For example:

- a role-surface tenant may receive the role-surface bundle
- a stakeholder/service-module tenant may receive the stakeholder bundle
- a hybrid tenant may receive a combination

This means bundles help translate tenant-type patterns into practical provisioning logic.

## Relationship to Registration

Capability bundles are likely to become one of the most important parts of future tenant registration.

Instead of onboarding a tenant from scratch, the platform should eventually be able to assign:

- common baseline bundle
- tenant-type bundle
- optional add-on bundle
- pilot bundle
- restricted or disabled bundle

This makes onboarding more systematic and less dependent on memory.

## Relationship to Parity

Bundles improve parity because they allow the platform to ask:

- does this tenant have the expected bundle
- is the bundle fully present or partially present
- was one part of the bundle forgotten
- is the bundle intentionally withheld
- is the bundle still in rollout

This is more useful than tracking only single-item presence.

## Relationship to Reusable Extraction

Reusable extraction should help discover bundle candidates.

If certain items repeatedly appear together across tenants, they may be promoted into a capability bundle.

That means bundles should emerge from observed platform learning, not only top-down theory.

## Current Platform Direction

At this stage, the platform is beginning to show signs of at least these bundle candidates:

- business minimum bundle
- role-surface bundle
- stakeholder/service-module bundle

These should remain flexible for now, but they are strong enough to begin naming and tracking.

## Final Principle

A mature platform should not only know what individual items exist.

It should know which capabilities belong together.

This layer exists so repeated groups of value can become governed bundles rather than scattered local additions.
