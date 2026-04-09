# Matrix Status Codes

## Purpose

This layer defines the status codes used across the Service Availability Matrix.

It exists so the platform can describe tenant state, bundle state, rollout state, and parity state in a more consistent way.

Without shared status language, the matrix becomes harder to compare and automate later.

## Why This Exists

The matrix already uses terms such as:

- missing
- scaffolded
- documented
- operational
- reusable
- standard
- active
- partial
- aligned

These are useful, but they should be interpreted consistently.

This file establishes a common status vocabulary for matrix work.

## Core Principle

A status code should communicate one clear idea.

Status language should help the platform answer:

- does it exist
- how mature is it
- how stable is it
- how reusable is it
- how available is it
- how aligned is it

## Category 1 — Presence and Maturity Codes

### Missing
The item does not currently exist.

### Placeholder
The item exists only as a name or minimal shell and does not yet provide meaningful content.

### Scaffolded
The item has enough structure to show intended direction, but is still incomplete.

### Documented
The item exists with usable written content.

### Implemented
The item exists beyond documentation and has meaningful structural realization.

### Operational
The item is live enough to be treated as actively functioning in the tenant or platform.

## Category 2 — Reuse and Promotion Codes

### Tenant-Specific Only
The item is currently meaningful only for one tenant and should not yet be generalized.

### Comparable
The item exists in more than one tenant in a way that allows comparison.

### Reusable Candidate
The item is strong enough to be considered for reuse or upward promotion.

### Reusable
The item is clearly reusable across tenant contexts.

### Standardized
The item has become part of expected common architecture.

### Registration Default Candidate
The item is strong enough to be considered for future registration defaults.

### Registration Default
The item is now part of expected onboarding baseline.

## Category 3 — Rollout Codes

### Not Introduced
The capability is not yet part of expected current tenant structure.

### Planned
The capability is intended but not yet provisioned.

### Pilot
The capability exists in limited or trial form.

### Partial Rollout
The capability exists across some relevant places, but not yet fully.

### Active
The capability is in current expected use.

### Expanding
The capability is active and being intentionally extended.

### Deprecated
The capability is still present but moving toward reduced use or removal.

### Retired
The capability is no longer part of expected current structure.

## Category 4 — Parity Codes

### Aligned
The tenant matches the expected parity state for the relevant baseline or profile.

### Partially Aligned
The tenant matches some, but not all, expected parity items.

### Profile-Aligned
The tenant differs from others, but in a way that is appropriate for its profile.

### Conditionally Aligned
The tenant differs in a way that is acceptable because of rollout, optionality, or capability conditions.

### Under-Provisioned
The tenant is missing something that it likely should already have.

### Drift Detected
The observed difference appears accidental, unexplained, or structurally concerning.

### Intentionally Different
The difference is valid, documented, and accepted as part of the tenant’s current state.

## Category 5 — Registration Readiness Codes

### Not Ready
The tenant is too incomplete to be treated as a properly registered business instance.

### Partially Ready
The tenant has some important elements, but not enough for baseline readiness.

### Baseline Ready
The tenant satisfies the current minimum expected baseline.

### Parity-Ready
The tenant is mature enough to participate meaningfully in parity comparison.

### Registration-Ready
The tenant is strong enough to be treated as a proper governed business instance and future template reference.

## Usage Rule

The same code should mean the same thing wherever it appears.

This does not mean every layer uses every status.

It means each layer should choose status codes intentionally from a shared language.

## Recommended Practice

Where possible, each matrix file should pair status codes with:

- short notes
- interpretation
- next action

This keeps the status readable for both humans and future automation.

## Final Principle

A matrix becomes stronger when its language is stable.

This layer exists so matrix judgments become more comparable, interpretable, and governable.
