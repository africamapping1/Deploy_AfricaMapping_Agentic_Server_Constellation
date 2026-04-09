# Parity Actions

## Purpose

This layer defines what the platform should do after parity differences are observed.

It exists so parity does not remain only descriptive.

The platform should be able to move from:

- seeing a difference
- understanding the difference
- deciding whether to act

This is the action layer of parity governance inside the Service Availability Matrix.

## Why This Exists

A parity system that only reports differences is incomplete.

Once the platform can identify:

- shared baseline gaps
- profile-specific gaps
- conditional differences
- potential drift

it must also decide what kind of response is appropriate.

Without this layer, parity becomes interesting but operationally weak.

With this layer, parity becomes governable.

## Core Principle

Not every difference requires the same response.

The platform should respond differently to:

- a critical missing baseline item
- an acceptable profile-based difference
- a bundle that is partially provisioned
- a capability that is missing by mistake
- a feature that is intentionally deferred

Parity action must match parity meaning.

## Action Categories

### 1. No Action Needed

Use when the observed difference is:

- expected
- profile-aligned
- intentionally different
- not applicable

This means the matrix should record the difference, but not escalate it.

### 2. Observation Only

Use when the observed difference is:

- not yet harmful
- still emerging
- not mature enough for intervention
- worth watching over time

This means the platform should keep visibility without forcing premature change.

### 3. Documentation Action

Use when the observed difference is valid, but not well explained.

Examples:

- a service is missing intentionally, but not documented
- a tenant profile expectation is implied, but not written down
- a bundle difference exists, but the rationale is unclear

This means the first fix is better explanation, not immediate provisioning.

### 4. Parity Correction Action

Use when the observed difference is likely accidental.

Examples:

- a baseline item is missing from one tenant
- a tenant matrix entry is incomplete
- a common communication layer was added to one tenant but forgotten in another

This means the platform should correct the gap.

### 5. Profile Reassessment Action

Use when the observed difference suggests the tenant may no longer fit its assumed profile.

Examples:

- a tenant is gaining role-surface structures but is still treated only as stakeholder/service-module
- a tenant is expanding into broader module groupings and may be moving toward hybrid

This means the platform should review the tenant’s profile, not merely patch a file.

### 6. Bundle Upgrade Action

Use when a tenant is missing part of a bundle that its profile now clearly expects.

Examples:

- missing dashboard layer in a role-surface tenant
- missing stakeholder communication layer in a stakeholder/service-module tenant

This means the platform should think in grouped bundle terms, not isolated file terms.

### 7. Promotion Review Action

Use when parity differences reveal that something repeated enough to become a shared standard.

Examples:

- all tenants now carry the same business baseline
- all tenants now carry one short-form pitch
- most tenants now carry a deeper audience-facing communication

This means the platform should review whether the pattern should be promoted upward.

## Action Severity Guidance

Useful response levels may include:

- informational
- corrective
- structural
- profile-level
- promotion-level

These help the platform judge whether a difference is small, local, or architecture-shaping.

## Suggested Action Logic

### Shared Baseline Gap
Typical action:
- parity correction action

### Profile-Aligned Difference
Typical action:
- no action needed
- or documentation action

### Conditional Capability Difference
Typical action:
- observation only
- or documentation action

### Bundle Incompleteness
Typical action:
- bundle upgrade action

### Repeated Cross-Tenant Convergence
Typical action:
- promotion review action

### Profile Drift
Typical action:
- profile reassessment action

## Relationship to Governance

This layer should eventually support governance questions such as:

- which parity findings matter most
- which findings need correction
- which findings only need explanation
- which findings signal architectural evolution

This makes parity actionable without making it overreactive.

## Relationship to Doctor and Future Checks

This layer may later support:

- informational doctor passes
- warning-level parity checks
- profile-fit warnings
- registration-readiness blockers
- bundle incompleteness alerts

Not every action must immediately become automation.

But the logic should be defined here first.

## Final Principle

A parity system becomes useful when it can guide response.

This layer exists so tenant differences lead to the right action, not just more observation.
