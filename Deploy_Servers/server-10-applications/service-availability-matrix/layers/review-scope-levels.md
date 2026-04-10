# Review Scope Levels

## Purpose

This layer defines the size of review that should be performed after a matrix-relevant change.

It exists so the platform can scale review effort appropriately.

This is the review-scope layer of the Service Availability Matrix.

## Why This Exists

A small change does not always justify a wide review.

The platform needs a way to say:
- review only the local tenant file
- review the tenant and a few summaries
- review the broader matrix
- review standards and onboarding implications

This layer makes those levels explicit.

## Core Principle

Review effort should match change significance.

## Suggested Scope Levels

### Scope 1 — Local Tenant Review
Use when:
- one tenant changed in a small, local way
- no shared interpretation is likely affected

Typical files:
- the tenant matrix file
- the most local relevant summary if needed

### Scope 2 — Tenant Plus Summary Review
Use when:
- one tenant changed in a way that affects comparison or readiness meaning

Typical files:
- tenant file
- readiness summary
- parity summary
- profile-fit summary
- action summary

### Scope 3 — Cross-Tenant Interpretation Review
Use when:
- a change affects more than one tenant
- a bundle or profile meaning is changing
- parity interpretation may shift

Typical files:
- relevant layer file
- related summaries
- promotion or standardization views

### Scope 4 — Structural Review
Use when:
- shared baseline changes
- registration logic changes
- promotion threshold changes
- new standard candidates emerge

Typical files:
- layer logic
- registration baseline
- standardization summary
- near-term roadmap
- governance decision shortlist

## Final Principle

Not every change deserves the same-sized review.

This layer exists so the matrix review process stays disciplined and scalable.
