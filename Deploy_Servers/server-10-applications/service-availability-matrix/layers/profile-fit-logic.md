# Profile Fit Logic

## Purpose

This layer defines how the platform should decide whether a tenant fits a registration profile strongly, partially, weakly, or not yet clearly.

It exists so profile assignment is disciplined rather than intuitive guesswork.

This is the profile-fit logic layer of the Service Availability Matrix.

## Why This Exists

The platform now recognizes profiles such as:

- role-surface
- stakeholder / service-module
- hybrid

But a profile should not be assigned casually.

The platform needs a stable way to ask:

- why does this tenant fit this profile
- how strong is that fit
- is the fit changing over time

## Core Principle

A profile fit should be based on visible patterns, not only labels.

The stronger the visible pattern, the stronger the profile fit.

## Fit Questions

When assessing profile fit, the platform should ask:

### Surface Pattern Questions
- does the tenant show role-based user surfaces
- does it show stakeholder-facing structures
- does it show broader service-module grouping
- does it show both strongly enough to suggest hybrid

### Communication Pattern Questions
- does the tenant speak mainly through investor/customer/operator logic
- does it speak mainly through stakeholder/partner/service logic
- does it clearly need multiple communication angles at once

### Bundle Pattern Questions
- does the tenant show role-surface bundle signals
- does it show stakeholder/service-module bundle signals
- are both present strongly enough to justify hybrid

## Suggested Fit States

### Strong Fit
Use when a tenant clearly matches a profile and the evidence is visible and stable.

### Partial Fit
Use when a tenant leans toward a profile, but important expected signals are still weak or incomplete.

### Weak Fit
Use when a profile label is possible, but the evidence is still thin.

### Mixed Fit
Use when the tenant shows meaningful signals from more than one profile without one clearly dominating yet.

### Unclear Fit
Use when the tenant is still too early or too weakly formed to judge confidently.

## Relationship to Lifecycle

Profile fit may become stronger as a tenant matures.

A tenant early in lifecycle may have weak or unclear fit.

A tenant later in lifecycle may have strong or mixed fit.

## Relationship to Parity

Parity should depend on fit strength.

A strong-fit tenant can be judged more confidently against profile expectations.

A weak-fit tenant should be judged more cautiously.

## Final Principle

A profile should be assigned because a pattern is visible, not because the platform wants a label too early.

This layer exists so profile interpretation becomes more disciplined and explainable.
