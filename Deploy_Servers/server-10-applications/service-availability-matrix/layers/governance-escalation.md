# Governance Escalation

## Purpose

This layer defines when observations from the Service Availability Matrix should remain local and when they should rise into broader governance attention.

It exists so the platform can distinguish between:

- normal tenant variation
- parity drift
- registration weakness
- architectural issues that deserve governance review

This is the escalation layer of the Service Availability Matrix.

## Why This Exists

Not every matrix finding is equally important.

Some findings are small and local.

Some findings reveal larger issues such as:

- weak registration defaults
- confused tenant profiles
- incomplete parity expectations
- missing promotion decisions
- unstable standardization

Without escalation logic, the platform risks:

- ignoring important structural issues
- escalating too much noise
- confusing local gaps with architectural problems

This layer exists to make escalation disciplined.

## Core Principle

Escalation should be proportional.

A small tenant-local omission should not be treated like an architectural failure.

A repeated cross-tenant problem should not be treated like a minor note.

## Escalation Levels

### Level 0 — Local Observation

Use when the issue is:

- small
- tenant-specific
- not blocking readiness
- not affecting parity in a meaningful way

Typical examples:

- one optional communication file missing
- a profile-consistent capability marked pending
- a draft bundle still under observation

### Level 1 — Tenant Correction

Use when the issue is still local, but clearly deserves correction.

Typical examples:

- a baseline business item is missing
- a tenant matrix file is incomplete
- a profile-expected surface is absent without explanation

### Level 2 — Cross-Tenant Review

Use when the issue appears across more than one tenant or affects the meaning of parity more broadly.

Typical examples:

- multiple tenants missing the same baseline item
- communication baselines are unclear across tenants
- bundle definitions are repeatedly inconsistent

### Level 3 — Application-Plane Review

Use when the issue suggests a problem with shared application-plane standards or reusable framework decisions.

Typical examples:

- registration baseline is too weak
- promotion thresholds are unclear
- shared framework is missing a now-repeated pattern
- tenant-type profiles are no longer sufficient

### Level 4 — Governance Attention

Use when the issue affects broader platform shaping or requires governed architectural judgment.

Typical examples:

- repeated parity confusion across tenant types
- unstable standardization decisions
- unresolved tension between tenant variation and shared standards
- onboarding profiles no longer fit real tenant growth

## Escalation Triggers

A matrix issue is more likely to escalate when it is:

- repeated across multiple tenants
- affecting registration readiness
- creating unfair parity drift
- confusing profile interpretation
- blocking promotion or standardization decisions
- causing onboarding inconsistency
- weakening the boundary between shared framework and tenant-specific structure

## Suggested Escalation Questions

When reviewing a matrix finding, the platform should ask:

- is this only local
- does this affect more than one tenant
- does this reveal a weak standard
- does this reveal a weak profile
- does this reveal a weak registration default
- would ignoring this make future onboarding worse
- does this need governance judgment rather than local correction

## Escalation Outcomes

Possible outcomes may include:

- leave local
- correct in tenant space
- update matrix interpretation
- strengthen bundle definition
- strengthen profile definition
- strengthen registration baseline
- review promotion decision
- raise architectural discussion

## Relationship to Parity Actions

Parity actions describe what kind of response is appropriate.

Governance escalation describes how high that response needs to travel.

The two layers should work together:

- parity actions = action type
- escalation = action altitude

## Relationship to Future Automation

Over time, this layer may support:

- warning thresholds
- governance review triggers
- doctor integration
- promotion review checkpoints
- onboarding risk flags

But the logic should be understood here before it is automated.

## Final Principle

A mature platform should know not only what is wrong or incomplete.

It should know how high the issue needs to rise.

This layer exists so Service Availability Matrix findings become governable at the right level.
