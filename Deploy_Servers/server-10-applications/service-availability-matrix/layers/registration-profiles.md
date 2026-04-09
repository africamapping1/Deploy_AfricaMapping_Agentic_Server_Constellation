# Registration Profiles

## Purpose

This layer defines how the platform should translate shared standards, tenant types, and capability bundles into practical onboarding profiles for future tenant registration.

It exists so tenant creation can move from manual folder-by-folder setup toward governed, profile-based provisioning.

This is the registration-profile layer of the Service Availability Matrix.

## Why This Exists

The platform has now begun to learn several things:

- a shared minimum tenant baseline exists
- not every tenant needs the same surface mix
- some bundles are meaningful only for certain tenant types
- some differences are legitimate and should be governed, not erased

That means future registration should not be:

- completely manual
- identical for every tenant
- dependent on memory
- decided ad hoc each time

Instead, future tenant onboarding should begin from registration profiles.

## Core Principle

A registration profile is a governed starting pattern for a new tenant.

It combines:

- shared baseline requirements
- tenant-type expectations
- capability bundles
- matrix visibility
- initial readiness assumptions

A tenant may later evolve beyond its profile.

But it should not start undefined.

## What a Registration Profile Should Include

A registration profile should describe:

### 1. Shared Baseline
What every tenant in this profile receives by default.

Examples:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- short-form pitch
- one deeper audience-facing communication
- matrix enrollment

### 2. Tenant-Type Assumptions
What kind of tenant this profile is intended for.

Examples:

- role-surface tenant
- stakeholder/service-module tenant
- hybrid tenant
- future investor-facing tenant
- future integration-heavy tenant

### 3. Capability Bundle Expectations
Which bundles are expected by default for this profile.

Examples:

- business minimum bundle
- role-surface bundle
- stakeholder/service-module bundle
- integration-oriented bundle

### 4. Surface Expectations
Which surfaces should normally exist, be optional, or be marked not applicable.

Examples:

- website
- UI
- dashboards
- customer surface
- employee surface
- stakeholder-facing surface
- operator-facing surface

### 5. Matrix Starting State
How the tenant should enter the Service Availability Matrix.

Examples:

- baseline ready
- registration-ready
- partial rollout
- pilot profile
- restricted profile

## Why Profiles Matter

Profiles allow the platform to do three important things:

- standardize common starting structure
- preserve valid tenant differences
- reduce accidental omissions during onboarding

Without profiles, the platform risks swinging between two bad extremes:

- every tenant is forced into the same shape
- every tenant is built from scratch with no standard at all

Profiles provide the middle path.

## Current Emerging Profile Types

At this stage, the platform is already beginning to suggest at least two strong profile types.

### 1. Role-Surface Registration Profile

This profile is appropriate for tenants that depend strongly on role-based user visibility and business surfaces.

Typical characteristics may include:

- customer and employee distinction
- dashboard orientation
- UI-heavy visibility
- role-aware communication needs
- customer/operator explanation patterns

Current model example:
- `realestate-ai`

### 2. Stakeholder / Service-Module Registration Profile

This profile is appropriate for tenants that depend more on stakeholder-facing business explanation and grouped service-module structure.

Typical characteristics may include:

- stakeholder-facing communication
- broader operational grouping
- service-module areas
- integration-oriented organization
- partner or institutional explanation needs

Current model example:
- `africamapping`

### 3. Hybrid Registration Profile

A future profile may combine both patterns.

Typical characteristics may include:

- role-based user surfaces
- stakeholder-facing communication
- service-module breadth
- richer bundle composition

This profile is likely to become important as tenant complexity grows.

## Current Shared Registration Baseline

The current shared registration baseline should likely include:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- one short-form pitch
- one deeper audience-facing communication
- service availability matrix entry

This is currently the strongest evidence-backed baseline in the platform.

## Profile States

Useful states for registration profiles may include:

- draft
- observed
- reusable
- standard profile
- registration default profile

This helps the platform distinguish between an idea and a governed onboarding path.

## Relationship to Promotion Thresholds

A registration profile should not become standard too early.

It should usually depend on patterns that have already crossed reasonable promotion thresholds.

That means registration profiles should be fed by:

- promotion candidates
- standardization summary
- bundle states
- tenant-type observations

## Relationship to Future UI Registration

This layer is especially important for future user-interface-based tenant onboarding.

Eventually, a UI-driven registration flow should be able to ask:

- which registration profile applies
- which shared baseline should be provisioned
- which capability bundles should be enabled
- which surfaces should be created
- which deeper communication type should be generated first
- how the tenant should enter matrix visibility

This is how onboarding becomes governed and reproducible.

## Relationship to Parity

Profiles improve parity by making expectations profile-aware.

This means parity should not always ask:

- does every tenant have the exact same thing

It should more intelligently ask:

- does this tenant have what its profile expects
- is absence intentional, profile-based, or accidental
- is the tenant under-provisioned relative to its intended pattern

## Governance Value

Registration profiles make it easier to:

- onboard future tenants
- govern expected capability packages
- compare similar tenants fairly
- avoid accidental under-building
- prepare for profile-aware parity checks
- support future provisioning automation

## Final Principle

A mature platform should not register tenants as blank folders.

It should register them through governed profiles.

This layer exists so future tenant onboarding begins from structured, explainable, and repeatable patterns instead of improvisation.
