# Exception Handling

## Purpose

This layer defines how the Service Availability Matrix should handle valid exceptions without weakening the overall governance model.

It exists so the platform can allow justified difference without falling into undocumented inconsistency.

This is the exception-handling layer of the Service Availability Matrix.

## Why This Exists

A mature platform must allow exceptions.

Examples include:

- a tenant truly does not need a certain surface
- a communication artifact is intentionally delayed
- a bundle is withheld for valid reasons
- a pilot tenant is intentionally incomplete
- a profile is still transitioning

Without exception handling, the platform risks over-standardizing.

Without governance around exceptions, the platform risks drift.

This layer provides the middle path.

## Core Principle

An exception is acceptable when it is:

- visible
- explainable
- bounded
- reviewed
- not silently permanent by accident

## Types of Exceptions

### 1. Not Applicable Exception

Use when a capability is genuinely irrelevant to the tenant profile or business shape.

### 2. Delayed Exception

Use when a capability is intended, but intentionally not yet provisioned.

### 3. Pilot Exception

Use when a tenant is intentionally incomplete because it is part of a limited rollout or pilot state.

### 4. Transitional Exception

Use when the tenant is moving between profiles, bundles, or rollout states.

### 5. Restricted Exception

Use when a capability is intentionally withheld because of policy, scope, or current boundary conditions.

## What Every Exception Should Record

A valid exception should record at least:

- what is absent or different
- why it is acceptable
- whether it is temporary or durable
- whether future review is required
- whether parity should ignore or watch it

## Suggested Exception States

Useful exception states may include:

- valid
- valid but temporary
- under review
- expiring
- no longer justified

These help the platform avoid leaving old exceptions unexamined forever.

## Relationship to Parity

Exceptions should inform parity interpretation.

A valid documented exception should not be treated the same as accidental drift.

Parity should therefore ask:

- is this a true exception
- is it documented
- is it still justified
- is it now stale

## Relationship to Governance Escalation

Some exceptions can remain local.

Others may need higher review if they:

- last too long
- affect multiple tenants
- weaken a shared baseline
- block standardization

## Final Principle

A good platform allows exceptions without becoming loose.

This layer exists so difference can be governed without becoming chaos.
