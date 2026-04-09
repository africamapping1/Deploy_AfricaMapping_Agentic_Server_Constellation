# Reusable Extraction

## Purpose

This layer defines how the platform should identify patterns that are strong enough to be reused, standardized, or promoted upward from tenant-specific business space into shared application-plane structure.

It exists so the platform can learn from repeated tenant development rather than leaving useful patterns trapped inside one tenant.

This is the learning and promotion layer of the Service Availability Matrix.

## Why This Exists

A growing platform should not only ask:

- does this tenant have this capability
- how mature is it
- is it missing or present

It should also ask:

- is this pattern now repeatable
- is it strong enough to reuse
- should it become common framework
- should it become application-plane standard
- should future tenants receive it by default

Without this layer, each tenant may keep solving the same structural problem independently.

With this layer, repeated tenant work can become shared platform intelligence.

## Core Principle

The platform should learn from repetition.

If a capability, structure, or pattern appears across tenants with enough consistency and maturity, it may be eligible for promotion into reusable shared structure.

## What Reusable Extraction Looks For

This layer should look for items such as:

- repeated document structures
- repeated communications patterns
- repeated business-model components
- repeated service surfaces
- repeated role-surface patterns
- repeated capability bundles
- repeated onboarding or baseline expectations

The key question is not only whether something exists more than once.

The key question is whether it is comparable, mature, and useful enough to become shared.

## Promotion Questions

When evaluating a pattern for reuse, the system should ask:

- does this appear across multiple tenants
- is it structurally comparable
- is it mature enough to matter
- does it solve a repeated need
- is it likely to be needed by future tenants
- should it live in tenant space, shared business framework, or application-plane standard structure

## Candidate Promotion Targets

A repeated pattern may eventually be promoted into one of the following layers:

### 1. Shared Business Framework
Use when the pattern is reusable business intelligence.

Examples:

- communications structures
- canvas structures
- business-model logic
- perspective logic
- narrative patterns

### 2. Application-Plane Standard Structure
Use when the pattern is becoming part of standard tenant architecture.

Examples:

- standard business minimums
- standard tenant communications baseline
- standard role-surface expectations
- standard service bundle expectations

### 3. Registration Defaults
Use when the pattern should be automatically considered for future tenant creation.

Examples:

- default business README
- default canvas overview
- default strategy layer
- default communications baseline
- default service package for a tenant type

## Maturity Logic

Useful states for reusable extraction may include:

- not reusable
- tenant-specific only
- comparable
- reusable candidate
- reusable
- standardized
- registration default candidate

These states help the platform distinguish between repetition and promotion readiness.

## Examples of Reusable Extraction

Examples of things that may become reusable over time include:

- business README pattern
- canvas overview pattern
- strategy README pattern
- communications README pattern
- short-form pitch baseline
- one deeper audience-facing pitch baseline
- role-based surface package
- tenant business minimum standard

Examples of things that may remain tenant-specific include:

- investor pitch for a tenant that uniquely needs it
- highly specific stakeholder language
- tenant-specific integrations
- tenant-specific module groupings

## Comparison Rule

This layer should compare not only presence, but shape.

For example:

- two tenants may both have an elevator pitch
- but one may be too weak to be reusable
- two tenants may both have strategy README files
- and those may be strong enough to define a shared baseline

The system should therefore evaluate both similarity and quality.

## Relationship to Tenant Parity

Reusable extraction supports parity by identifying what should become common expectation.

If a structure is repeated often enough and becomes standard, then future parity checks can expect it more explicitly.

This means reusable extraction helps convert repeated practice into governed parity.

## Relationship to Growth

As more tenants are added, this layer becomes more important.

It helps the platform avoid two bad outcomes:

- every tenant being reinvented from scratch
- every tenant being forced into a rigid model too early

Instead, it allows the platform to grow through observed repeatability.

## Final Principle

A mature platform should learn what can be shared.

This layer exists so repeated tenant capability becomes reusable system intelligence rather than isolated local structure.
