# Evidence Sources

## Purpose

This layer defines what kinds of evidence the Service Availability Matrix should use when making judgments about tenant state, parity, readiness, bundles, and promotion.

It exists so matrix interpretation stays grounded in visible reality.

This is the evidence-source layer of the Service Availability Matrix.

## Why This Exists

A matrix becomes weak when it relies too much on assumption.

The platform should be able to say:

- what evidence supports this judgment
- where that evidence came from
- whether the evidence is direct or interpretive
- whether the evidence is strong enough for promotion or enforcement

Without this layer, matrix judgments can become vague or overly subjective.

## Core Principle

Every meaningful matrix interpretation should be grounded in visible evidence.

The stronger the consequence of the judgment, the stronger the evidence should be.

## Evidence Source Categories

### 1. Direct File Presence Evidence

This is the strongest early form of evidence.

Examples:
- file exists
- folder exists
- tenant matrix entry exists
- expected baseline file exists

This is useful for:
- baseline checks
- matrix enrollment checks
- simple readiness checks

### 2. Direct Content Evidence

This is evidence that comes from what a file actually contains, not just that it exists.

Examples:
- a README contains real explanatory content
- a pitch file contains actual tenant messaging
- a profile file expresses real expectations
- a tenant file contains meaningful interpretation

This is useful for:
- maturity checks
- documented vs placeholder distinction
- promotion evaluation

### 3. Structural Pattern Evidence

This is evidence that comes from repeated structure across tenants.

Examples:
- both tenants have a business README
- both tenants have a canvas overview
- both tenants have a short-form pitch
- similar folders and layers appear across tenants

This is useful for:
- reproducibility
- standardization
- promotion candidates

### 4. Surface Evidence

This is evidence that a service or business presence is visible beyond documentation.

Examples:
- website subtree exists
- user-interface subtree exists
- customer or employee surfaces are represented
- dashboard-related structures exist

This is useful for:
- surface availability
- bundle interpretation
- profile fit support

### 5. Comparative Evidence

This is evidence that emerges when two or more tenants are compared.

Examples:
- same baseline present in multiple tenants
- similar communication pattern appears in multiple tenants
- profile differences appear valid and consistent

This is useful for:
- parity interpretation
- promotion thresholds
- tenant-type recognition

### 6. Historical Evidence

This is evidence from prior matrix reviews, change logs, or evolving interpretations.

Examples:
- a pattern has remained stable over time
- a capability moved from draft to reusable candidate
- a previously optional item became baseline

This is useful for:
- promotion
- governance escalation
- standardization confidence

## Evidence Strength Guidance

Useful evidence strength levels may include:

- weak
- moderate
- strong
- cross-tenant strong
- historically strong

These do not need to appear in every file, but the platform should use this logic internally.

## Relationship to Promotion

Promotion should rely on stronger evidence than simple observation.

A pattern should usually not be promoted unless evidence is:

- cross-tenant
- structurally comparable
- mature enough in content
- useful enough to matter

## Relationship to Enforcement

The stronger the enforcement consequence, the stronger the evidence should be.

For example:

- informational note can rely on moderate evidence
- warning should usually rely on strong evidence
- blocking behavior should rely on very strong and low-ambiguity evidence

## Final Principle

A matrix judgment is only as strong as the evidence behind it.

This layer exists so tenant interpretation remains grounded, defensible, and governable.
