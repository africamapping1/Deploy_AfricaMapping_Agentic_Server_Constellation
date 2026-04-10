# Tenant Exception Summary

## Purpose

This file summarizes the current known and likely exception areas across tenants.

It exists so the platform can distinguish between valid differences and unresolved gaps.

This is the tenant exception interpretation layer above parity and readiness summaries.

## Why This Exists

The matrix already shows many differences.

But not all differences are problems.

Some are likely:

- profile-based
- rollout-based
- delayed intentionally
- not applicable
- still under observation

This file helps classify those cases more cleanly.

## Current Compared Tenants

At this time, the exception summary compares:

- `africamapping`
- `realestate-ai`

## Current Likely Exceptions

### `realestate-ai`

#### Missing Stakeholder Pitch
- Likely exception type: not applicable or delayed
- Reason: tenant currently fits role-surface profile more strongly than stakeholder/service-module profile
- Current interpretation: not automatically a defect

#### Lighter Service-Module Breadth
- Likely exception type: valid profile-based difference
- Reason: tenant currently emphasizes role-aware surfaces more strongly
- Current interpretation: acceptable unless profile changes

### `africamapping`

#### Missing Investor Pitch
- Likely exception type: not applicable or delayed
- Reason: tenant currently fits stakeholder/service-module profile more strongly than investor-facing role-surface logic
- Current interpretation: not automatically a defect

#### Weaker Role-Based User Surface Pattern
- Likely exception type: valid profile-based difference
- Reason: tenant currently emphasizes stakeholder/service-module logic more strongly
- Current interpretation: acceptable unless profile changes

## Shared Likely Exceptions

### Missing Richer Business-Model Detail
- Likely exception type: delayed
- Reason: both tenants are baseline-ready but not yet deep in business-model detail
- Current interpretation: shared next-step gap, not a one-tenant defect

### Missing Positioning / Operator Explanation / Objection Handling
- Likely exception type: delayed
- Reason: both tenants have baseline communication but not yet richer communication maturity
- Current interpretation: planned strengthening area, not current failure

### Integration-Oriented Bundle Weakness
- Likely exception type: under observation
- Reason: pattern is visible but not yet stable enough to demand stronger parity
- Current interpretation: continue observing, do not over-enforce

## Exception Management Guidance

At the current stage, these exceptions should generally be treated as:

- visible
- explainable
- non-blocking
- reviewable later

None of these currently look like critical hidden drift.

## When Exceptions Should Be Revisited

These exceptions should be reviewed again when:

- a tenant profile changes
- a bundle becomes stronger standard
- rollout state changes
- richer communication maturity becomes baseline
- business-model detail becomes stronger expectation

## Final Interpretation

The current tenant differences are still mostly healthy.

This file exists so the platform can preserve that nuance and avoid treating every absence like a defect.
