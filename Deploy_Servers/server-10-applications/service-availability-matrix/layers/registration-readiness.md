# Registration Readiness

## Purpose

This layer defines how the platform should evaluate whether a tenant is ready to be treated as a properly registered and governed business instance.

It exists to prevent tenants from being considered complete simply because a folder exists.

A tenant is more registration-ready when it has enough structure, business clarity, communication readiness, and service definition to be instantiated, compared, and extended in a controlled way.

## Why This Exists

A platform that grows through new tenants needs a way to answer questions such as:

- is this tenant ready to be onboarded into the standard business plane
- is its baseline complete enough to compare with others
- is it ready for parity tracking
- is it ready for future UI-driven registration logic
- is it still only a partial scaffold

Without this layer, tenant creation remains ad hoc.

With this layer, tenant onboarding can become governed and repeatable.

## Core Principle

Registration readiness is not just about presence.

It is about whether the tenant has enough structured foundation to enter the platform as a coherent business line.

A tenant becomes more registration-ready when it is:

- understandable
- documentable
- comparable
- extendable
- parity-visible

## What Registration Readiness Should Evaluate

This layer should evaluate at least four readiness areas:

### 1. Identity Readiness

Can the tenant be identified and understood at a high level?

Examples:

- tenant README exists
- tenant business README exists
- tenant has a defined business identity

### 2. Business Readiness

Does the tenant have enough business structure to be meaningful?

Examples:

- canvas overview exists
- business-model README exists
- strategy README exists
- communications README exists

### 3. Communication Readiness

Can the tenant explain itself at least minimally?

Examples:

- elevator pitch exists
- at least one deeper audience-facing communication exists

### 4. Surface Readiness

Does the tenant have an explicit service or interface profile?

Examples:

- website presence is known
- UI presence is known
- dashboard expectations are known
- customer or employee surface expectations are known
- not-applicable status is explicitly documented where needed

## Suggested Readiness States

Useful readiness states may include:

- not ready
- partially ready
- baseline ready
- parity-ready
- registration-ready

These states help the platform judge whether a tenant is still being shaped or can now be treated as a governed business instance.

## Minimum Registration Baseline

At this time, a tenant should generally not be considered registration-ready unless it has at least:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- one short-form pitch
- one deeper audience-facing communication
- a visible matrix entry
- an explicit surface profile, even if partial

This baseline may evolve as the platform learns.

## Relationship to Tenant Parity

Registration readiness and tenant parity are connected.

A tenant that is not registration-ready is harder to compare fairly.

A tenant that is registration-ready can enter parity logic with clearer expectations.

This means readiness is the threshold before deeper parity becomes meaningful.

## Relationship to Reusable Extraction

As patterns become more stable across tenants, the registration baseline should improve.

That means this layer should learn from reusable extraction.

If repeated tenant elements prove consistently useful, they may become part of the standard readiness threshold.

## Relationship to Future UI Registration

This layer is especially important for future UI-driven onboarding.

Eventually, a registration flow should be able to ask:

- is the tenant baseline complete
- which tenant profile applies
- which capability package should be assigned
- which required business minimums have been provisioned
- whether the tenant is ready to move from creation into governed operation

This layer provides the logic for that future state.

## Comparison Rule

This layer should support questions such as:

- which tenants are only partially shaped
- which tenants are baseline-ready
- which tenants are ready to become templates for future onboarding
- where the platform still lacks enough repeatable structure to automate registration safely

## Governance Value

A registration-ready tenant is easier to:

- onboard
- govern
- compare
- provision
- extend
- audit
- include in future capability rollout and parity checks

Readiness is therefore both a business-plane and governance-plane concern.

## Final Principle

A tenant should not become a governed business instance by accident.

It should cross a visible readiness threshold.

This layer exists to make that threshold explicit.
