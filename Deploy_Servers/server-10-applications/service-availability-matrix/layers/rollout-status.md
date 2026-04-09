# Rollout Status

## Purpose

This layer defines how the platform should describe capabilities that are in transition across tenants.

It exists so the Service Availability Matrix can represent not only stable presence or absence, but also staged rollout reality.

This is the rollout-status layer of the Service Availability Matrix.

## Why This Exists

As the platform grows, capabilities will not appear everywhere at once.

A new capability may be:

- introduced in one tenant first
- piloted in a small scope
- added to one profile before another
- partially provisioned
- intentionally delayed
- later expanded or removed

Without rollout states, the matrix may incorrectly interpret transition as drift.

With rollout states, the platform can say:

- this is coming
- this is piloted
- this is partial
- this is intentionally delayed
- this is deprecated

## Core Principle

A capability in motion should not be mistaken for a stable parity failure.

The matrix should be able to represent rollout honestly.

## Suggested Rollout States

### Not Introduced
The capability is not yet part of current tenant expectations.

### Planned
The capability is intended, but not yet provisioned.

### Pilot
The capability exists in limited form, usually in one tenant or one profile first.

### Partial Rollout
The capability is present in more than one place, but not yet complete or consistent.

### Active
The capability is now a real current offering or expectation.

### Expanding
The capability is active and being intentionally extended to more tenants, profiles, or bundles.

### Deprecated
The capability still exists, but is moving toward reduced reliance or removal.

### Retired
The capability is no longer part of expected current structure.

## Why Rollout States Matter

Rollout states help the platform distinguish between:

- a missing feature
- a feature not yet meant to be present
- a feature under intentional expansion
- a feature already expected everywhere
- a feature being phased out

This makes parity and readiness much more accurate.

## Rollout Questions

When evaluating a capability, the platform should ask:

- is this capability already expected across tenants
- is it only being piloted
- is rollout still partial
- is absence a drift problem or simply rollout timing
- is this capability actually being retired

## Relationship to Parity

Rollout status should inform parity interpretation.

For example:

- if a feature is in pilot, absence elsewhere is not drift
- if a feature is in active cross-tenant state, absence may become drift
- if a feature is expanding, parity expectations may be transitional
- if a feature is deprecated, parity checks should loosen over time

## Relationship to Registration Profiles

Registration profiles may change as rollout status changes.

For example:

- a bundle may be optional during pilot phase
- later become active for one profile
- later become standard for new tenants
- later become registration default

This means rollout logic should influence onboarding expectations.

## Relationship to Bundle States

Bundle states describe maturity.

Rollout states describe deployment motion.

A bundle may be:

- mature enough to reuse
- but still only in pilot rollout

These should not be confused.

## Current Use Cases

Examples of future capabilities that may benefit from rollout status include:

- role-surface packages
- stakeholder/service-module packages
- advanced communications layers
- detailed business-model defaults
- integration-oriented bundles
- future onboarding automation

## Governance Value

Rollout status helps governance by making transition visible.

It supports better decisions about:

- when parity should tighten
- when absence is acceptable
- when promotion should wait
- when standardization is truly real

## Final Principle

A growing platform must understand movement, not only structure.

This layer exists so the matrix can represent capability rollout honestly and avoid mistaking transition for failure.
