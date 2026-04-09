# Bundle States

## Purpose

This layer defines how the platform should describe the status of capability bundles across tenants.

It exists so bundle tracking does not remain vague.

A bundle should not only be named.

It should have a visible state that explains how real, complete, and usable it is.

## Why This Exists

The platform is beginning to identify bundle patterns such as:

- business minimum bundle
- role-surface bundle
- stakeholder/service-module bundle
- integration-oriented bundle

But a bundle name alone is not enough.

The system also needs to know:

- is this bundle only an idea
- is it already visible in one tenant
- is it comparable across tenants
- is it reusable
- is it already standard
- is it now safe to use in registration defaults

This layer exists to define those stages clearly.

## Core Principle

A bundle becomes more valuable when its state is explicit.

The platform should always know whether a bundle is:

- emerging
- partial
- repeatable
- standardized
- ready for onboarding defaults

## Suggested Bundle States

### 1. Not Defined

The bundle is not yet recognized as a meaningful grouped pattern.

This means:

- no stable definition exists
- the elements are still too scattered
- the platform is not yet treating it as a real bundle

### 2. Draft

The bundle has been named conceptually, but is still mostly theoretical.

This means:

- the bundle idea exists
- the platform sees possible grouped value
- but tenant evidence is still limited or weak

### 3. Observed Pattern

The bundle is clearly visible in at least one tenant.

This means:

- the grouped pattern is real
- the elements appear together in practice
- but it may still be too tenant-specific to generalize

### 4. Partial Cross-Tenant Pattern

The bundle appears in more than one tenant, but unevenly or with important gaps.

This means:

- the bundle is becoming comparable
- parity is still incomplete
- the platform is still learning what belongs inside it

### 5. Reusable Candidate

The bundle is strong enough to be considered for broader reuse.

This means:

- the pattern is mature enough to matter
- it solves a repeated need
- it could inform future tenant provisioning
- it may be ready for stronger documentation

### 6. Reusable Bundle

The bundle is clearly reusable across tenants.

This means:

- the grouped capabilities are coherent
- the bundle can be intentionally assigned
- the platform understands its structure well enough to apply it again

### 7. Standard Bundle

The bundle has become part of the normal application-plane toolkit.

This means:

- the platform recognizes it as a stable pattern
- it is no longer only an observed tenant behavior
- it is now part of governed capability thinking

### 8. Registration Default Bundle

The bundle is strong enough to be assigned automatically or semi-automatically during future tenant onboarding.

This means:

- the bundle is stable
- the platform trusts it
- it can be part of governed registration logic

## Bundle State Interpretation

A bundle does not have to move directly from weak to strong in one jump.

A normal bundle journey may look like:

- draft
- observed pattern
- partial cross-tenant pattern
- reusable candidate
- reusable bundle
- standard bundle
- registration default bundle

This progression helps the platform mature through learning instead of assumption.

## Relationship to Tenant Types

Bundle states should often be interpreted together with tenant types.

For example:

- a role-surface bundle may be reusable for one tenant type before it is reusable for all tenants
- a stakeholder/service-module bundle may become standard for one tenant pattern but remain optional for another

This means a bundle can be mature without being universal.

## Relationship to Parity

Bundle states help improve parity thinking.

Instead of only asking whether a tenant has a capability, the platform can ask:

- should this tenant already have this bundle
- is the bundle standard yet or still emerging
- is absence acceptable or a parity concern
- is the bundle intentionally withheld or just not mature enough yet

## Relationship to Registration

Registration logic should eventually rely on strong bundle states.

Only bundles that are mature enough should become onboarding defaults.

This helps prevent the platform from freezing unstable patterns too early.

## Current Examples of Likely Bundle States

At the current stage, the platform may already interpret examples such as:

### Business Minimum Bundle
Likely state:
- reusable bundle
- moving toward standard bundle

### Role-Surface Bundle
Likely state:
- observed pattern
- reusable candidate

### Stakeholder / Service-Module Bundle
Likely state:
- observed pattern
- reusable candidate

### Integration-Oriented Bundle
Likely state:
- draft or observed pattern

These are working interpretations, not permanent law.

## Governance Value

Bundle states help the platform make stronger decisions about:

- reuse
- parity
- rollout
- onboarding defaults
- future UI registration behavior

They also reduce ambiguity when different people interpret the same tenant structures differently.

## Final Principle

A capability bundle should not only be visible.

It should be legible.

This layer exists so bundle maturity becomes explicit, comparable, and governable.
