# Matrix Review Cycle

## Purpose

This layer defines how often and under what conditions the Service Availability Matrix should be reviewed and updated.

It exists so the matrix does not become stale documentation.

The matrix should remain a living governance artifact.

## Why This Exists

A matrix that is created once and not revisited becomes misleading.

Tenant state changes over time because of:

- new files
- new bundles
- new registration profiles
- new services
- parity fixes
- rollout changes
- promotion decisions
- tenant evolution

This means the matrix needs a review cycle.

## Core Principle

The matrix should be reviewed whenever platform learning changes the meaning of tenant state.

A review cycle should be frequent enough to stay useful, but disciplined enough to avoid noise.

## Review Triggers

The matrix should be reviewed when any of the following happens:

### 1. New Tenant Added
A new tenant should always trigger matrix review.

This includes:
- tenant matrix file creation
- profile-fit review
- parity interpretation update
- readiness review

### 2. New Shared Baseline Item Added
If the platform strengthens the tenant baseline, the matrix should be reviewed across all tenants.

Examples:
- new standard communication minimum
- new standard business-model expectation
- new baseline surface expectation

### 3. New Bundle Introduced
If a new bundle is recognized, the matrix should be updated to reflect:
- bundle state
- rollout state
- tenant applicability
- parity implications

### 4. Profile Reassessment
If a tenant shifts from one profile pattern toward another, the matrix should be reviewed.

### 5. Promotion Decision
If something becomes:
- reusable
- standardized
- registration default

then the matrix should be updated to reflect the new expectation.

### 6. Rollout Change
If a capability changes rollout state, the matrix should be reviewed so parity interpretation stays accurate.

### 7. Periodic Governance Review
Even without big changes, the matrix should be reviewed on a regular cycle.

## Suggested Review Rhythm

Useful review rhythms may include:

- on major tenant changes
- on profile or bundle changes
- on promotion decisions
- on registration changes
- periodic review every defined governance interval

A simple starting rhythm could be:
- review after meaningful tenant architecture changes
- review again at each broader server-10 checkpoint

## Review Questions

When reviewing the matrix, the platform should ask:

- does the current matrix still describe reality
- did any baseline expectations change
- did any bundle state change
- did any tenant profile interpretation change
- did any promotion threshold get crossed
- did any conditional difference become a stronger parity concern
- did a future-facing concept become active enough to record

## Review Outcomes

A matrix review may result in:

- no change
- updated tenant states
- updated bundle states
- updated rollout states
- updated readiness status
- updated profile interpretation
- new promotion candidates
- stronger standardization judgment

## Review Ownership

The matrix should ultimately be reviewable by governance-aware platform actors.

In practice, review may involve:

- application-plane documentation updates
- strategist interpretation
- future doctor/parity logic
- future registration governance

The review process should stay explainable.

## Relationship to Governance Escalation

If review reveals only small tenant-local changes, the update may remain local.

If review reveals repeated or structural issues, escalation may be appropriate.

This means the review cycle and escalation logic should work together.

## Relationship to Future Automation

Later, some review triggers may be detectable automatically.

Examples:

- new tenant folder appears
- baseline file appears or disappears
- bundle pattern changes
- rollout status shifts

But before automation, the review logic should be clearly defined here.

## Final Principle

A living matrix must be reviewed as the platform learns.

This layer exists so the Service Availability Matrix remains current, useful, and governable over time.
