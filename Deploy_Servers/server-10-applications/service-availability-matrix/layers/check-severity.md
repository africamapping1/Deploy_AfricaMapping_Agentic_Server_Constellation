# Check Severity

## Purpose

This layer defines how severe different matrix findings should be treated.

It exists so the platform can distinguish between:

- low-impact observations
- useful warnings
- readiness concerns
- governance-relevant problems

This is the severity layer of the Service Availability Matrix.

## Why This Exists

Not every matrix finding matters equally.

A missing optional communication file is not the same as:

- missing tenant business baseline
- missing matrix enrollment
- missing profile-aware surface clarity in a mature tenant

Without severity logic, the platform may overreact to small issues or underreact to important ones.

## Core Principle

Severity should reflect consequence, not only difference.

The platform should care more when a finding affects:

- baseline trust
- readiness
- parity fairness
- onboarding quality
- governance clarity

## Suggested Severity Levels

### 1. Informational

Use when:
- the finding is useful to know
- but does not materially weaken readiness or parity

Examples:
- optional future communication file absent
- low-confidence profile hint missing
- under-observed bundle idea not yet present

### 2. Advisory

Use when:
- the finding suggests a next strengthening step
- but is not yet a real structural weakness

Examples:
- positioning file absent
- objection handling not yet present
- integration bundle still weak

### 3. Warning

Use when:
- the finding weakens current maturity meaningfully
- but does not yet justify blocking or major escalation

Examples:
- tenant matrix file missing
- deeper audience-facing communication missing
- profile fit unclear in a tenant expected to be registration-ready

### 4. Significant

Use when:
- the finding weakens shared baseline trust
- or makes parity and readiness materially less reliable

Examples:
- business README missing
- communications README missing
- canvas overview missing
- strategy README missing

### 5. Critical

Use when:
- the finding undermines whether the tenant should be treated as a valid governed business instance at all

Examples:
- multiple baseline anchors missing
- no matrix visibility for a supposedly governed tenant
- baseline not satisfied in a tenant assumed to be registration-ready

## Relationship to Enforcement

Severity should influence enforcement mode.

For example:
- informational findings stay informational
- advisory findings may shape next-step priorities
- warnings may justify stronger review
- significant findings may justify gated review
- critical findings may justify blocking in a mature future state

## Relationship to Review Cycle

Severity should also shape how quickly the issue is revisited.

Higher-severity findings should be reviewed sooner and more explicitly.

## Final Principle

A good platform should know not only what is wrong, but how much it matters.

This layer exists so matrix findings become proportionate and governable.
