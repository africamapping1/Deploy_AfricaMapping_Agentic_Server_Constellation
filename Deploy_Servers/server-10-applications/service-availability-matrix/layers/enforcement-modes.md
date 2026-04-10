# Enforcement Modes

## Purpose

This layer defines how the Service Availability Matrix should influence real platform behavior.

It exists so the matrix can move from documentation into controlled operational effect.

This is the enforcement layer of the Service Availability Matrix.

## Why This Exists

A matrix can remain useful as documentation only.

But if the platform is to mature operationally, the matrix must eventually affect:

- reviews
- onboarding
- parity checks
- provisioning decisions
- warnings
- governance escalation

Not every matrix finding should cause the same operational reaction.

This layer defines the modes of enforcement.

## Core Principle

Enforcement should be progressive.

The platform should not jump directly from documentation to hard blocking.

It should move through increasingly stronger operational modes.

## Enforcement Modes

### 1. Informational Mode

The matrix is used only for visibility and interpretation.

Typical effect:
- no blocking
- no automated correction
- used in reviews and human decision-making

Use when:
- a capability is still new
- a bundle is still forming
- a standard is still weak
- the platform is still learning

### 2. Advisory Mode

The matrix produces recommendations, expected-next-step guidance, and weak warnings.

Typical effect:
- review prompts
- suggested actions
- readiness notes
- parity awareness

Use when:
- a baseline is becoming stable
- tenant differences need interpretation
- a repeated pattern should now influence judgment

### 3. Warning Mode

The matrix raises visible warnings when expected conditions are not met.

Typical effect:
- readiness warnings
- parity warnings
- profile-fit warnings
- bundle incompleteness warnings

Use when:
- a baseline expectation is now strong
- absence is becoming a drift risk
- a profile expectation is meaningfully under-met

### 4. Gated Review Mode

The matrix does not yet block automatically, but it requires explicit review before certain actions continue.

Typical effect:
- onboarding review gate
- parity review gate
- promotion review gate
- registration profile review gate

Use when:
- the platform is mature enough that weak tenant structure is no longer acceptable
- profile fit must be confirmed
- promotion decisions must be justified

### 5. Blocking Mode

The matrix can block a change, registration step, or provisioning action if required conditions are not met.

Typical effect:
- registration block
- provisioning block
- promotion block
- baseline failure block

Use when:
- the expectation is already standard
- the missing element is critical
- allowing continuation would weaken governance or parity too much

## What Should Stay Out of Blocking Mode for Now

At the current maturity stage, some things should not yet become hard blocks.

Examples include:

- advanced communication artifacts
- integration-oriented bundle completeness
- richer profile-specific extras
- future-facing hybrid expectations

These should usually remain informational, advisory, or warning-level for now.

## Good Early Candidates for Warning or Gate Behavior

The strongest early candidates for stronger operational effect are:

- missing tenant README
- missing business README
- missing business-model README
- missing canvas overview
- missing communications README
- missing strategy README
- missing matrix tenant entry
- missing short-form pitch
- missing deeper audience-facing communication

These are the current strongest baseline signals.

## Relationship to Parity

Enforcement should be profile-aware.

That means:
- a missing profile-expected item may justify warning or gate
- a valid profile-specific difference should not be treated as a false violation

## Relationship to Registration

Registration is one of the strongest early operational targets.

The matrix should eventually influence whether a tenant is:

- not ready
- baseline ready
- registration-ready
- blocked pending correction

## Relationship to Governance

Governance should decide when a matrix expectation graduates from:

- informational
- to advisory
- to warning
- to gated review
- to blocking

This prevents accidental over-enforcement.

## Final Principle

The matrix should not remain passive forever.

But it should gain authority in stages.

This layer exists so operational control grows with maturity instead of arriving too early or too harshly.
