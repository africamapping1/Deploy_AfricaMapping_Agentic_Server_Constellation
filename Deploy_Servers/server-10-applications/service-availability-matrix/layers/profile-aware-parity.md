# Profile-Aware Parity

## Purpose

This layer defines how the platform should evaluate tenant parity in a way that respects tenant profiles.

It exists so parity does not become a naive demand that every tenant must look identical.

This is the profile-aware parity layer of the Service Availability Matrix.

## Why This Exists

The platform is already learning that tenants can differ for valid reasons.

For example:

- one tenant may fit a role-surface profile
- another may fit a stakeholder / service-module profile
- a future tenant may fit a hybrid profile

Without profile-aware parity, the platform risks making bad judgments such as:

- calling a valid absence a defect
- forcing the wrong surface package onto a tenant
- missing real drift because comparison logic is too generic

This layer exists to make parity more intelligent.

## Core Principle

Parity should compare tenants against the expectations of their profile, not only against each other.

That means parity should ask:

- does this tenant have what its profile expects
- are differences intentional, profile-based, or accidental
- is the tenant under-built relative to its intended pattern

## What Profile-Aware Parity Means

Profile-aware parity should distinguish between:

### 1. Shared Baseline Parity

These are expectations that should apply to all tenants regardless of profile.

Examples may include:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- one short-form pitch
- one deeper audience-facing communication
- matrix visibility

These are baseline parity checks.

### 2. Profile-Specific Parity

These are expectations that should apply only to tenants of a certain profile.

Examples:

- role-surface expectations for role-surface tenants
- stakeholder/service-module expectations for stakeholder-oriented tenants
- combined expectations for hybrid tenants

These are profile-aware parity checks.

### 3. Optional or Conditional Parity

These are items that may be relevant only if a tenant has chosen or been assigned a certain capability, bundle, or growth path.

Examples:

- investor-facing communication
- customer dashboard
- employee dashboard
- CRM grouping
- geospatial grouping
- integration package

These are conditional parity checks.

## Why This Matters

A good parity system should be able to tell the difference between:

- intentional difference
- valid profile difference
- temporary rollout difference
- missing capability by mistake

If it cannot do that, parity becomes noise.

## Parity Questions by Layer

### Shared Baseline Questions
- does every tenant have the minimum business baseline
- does every tenant have the minimum communication baseline
- is every tenant visible in the matrix

### Profile Questions
- does this role-surface tenant have role-aware surfaces
- does this stakeholder/service-module tenant have stakeholder-aware structure
- does this hybrid tenant have both dimensions represented

### Bundle Questions
- does this tenant have the bundles its profile expects
- is the bundle fully present, partial, or absent
- is absence intentional or accidental

## Suggested Parity States

Useful parity states may include:

- aligned
- partially aligned
- profile-aligned
- conditionally aligned
- drift detected
- under-provisioned
- intentionally different

These states make parity more descriptive and less binary.

## Examples

### Example 1 — Valid Difference
A stakeholder/service-module tenant lacks customer and employee dashboards.

Interpretation:
- not automatically a defect
- may be profile-aligned

### Example 2 — Likely Drift
A role-surface tenant lacks any documented customer or employee surface.

Interpretation:
- likely under-provisioned relative to profile
- parity concern

### Example 3 — Conditional Difference
One tenant has investor pitch and another does not.

Interpretation:
- not automatically a defect
- may depend on tenant profile, business maturity, or intended audience

## Relationship to Registration Profiles

This layer depends strongly on registration profiles.

A tenant cannot be judged fairly if the platform does not know what profile the tenant is meant to follow.

That means future parity logic should read:

- shared baseline
- tenant profile
- bundle expectations
- conditional service decisions

## Relationship to Service Availability Matrix

The matrix provides the raw visibility.

Profile-aware parity provides the interpretation.

The matrix says what exists.

Profile-aware parity says whether that state is acceptable.

## Relationship to Governance

Governance should eventually be able to inspect:

- where parity is shared-baseline strong
- where profile-specific drift exists
- where differences are valid and explainable
- where a tenant is under-built for its intended type

This makes parity a governed intelligence layer rather than a simplistic checklist.

## Future Direction

Over time, this layer may support:

- profile-aware doctor checks
- profile-aware onboarding validation
- rollout impact analysis
- conditional capability warnings
- tenant growth-path review

## Final Principle

Fair parity does not mean identical tenants.

It means every tenant is appropriately built for what it is supposed to be.

This layer exists so parity becomes profile-aware, explainable, and governable.
