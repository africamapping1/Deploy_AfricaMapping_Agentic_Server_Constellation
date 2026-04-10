# Summary Update Rules

## Purpose

This layer defines when the summary files of the Service Availability Matrix should be updated after changes to tenants, layers, profiles, or bundle logic.

It exists so summary files remain trustworthy.

This is the summary-maintenance layer of the Service Availability Matrix.

## Why This Exists

The matrix now contains many summary files, including summaries for:

- readiness
- bundles
- parity
- rollout
- profile fit
- standardization
- actions
- confidence
- lifecycle

If summaries are not updated when underlying logic changes, they become stale.

This layer prevents that drift.

## Core Principle

Whenever a change affects comparison or interpretation across tenants, the relevant summary file should be reviewed.

## Update Triggers

### 1. New Tenant Added

When a new tenant is created, review and update all affected summaries such as:

- summary.md
- readiness-summary.md
- bundle-summary.md
- profile-fit-summary.md
- parity-summary.md
- rollout-summary.md

### 2. New Baseline Item Added

When the shared baseline changes, review and update:

- tenant-business-minimums.md
- registration-baseline.md
- readiness-summary.md
- baseline-audit-summary.md
- standardization-summary.md

### 3. New Profile or Profile Shift

When a new profile is introduced or a tenant’s fit changes, review and update:

- tenant-types.md
- registration-profiles.md
- profile-fit-summary.md
- profile-drift-watchlist.md
- parity-summary.md

### 4. New Bundle or Bundle State Change

When a bundle becomes more visible or changes maturity, review and update:

- capability-bundles.md
- bundle-states.md
- bundle-summary.md
- bundle-states-summary.md
- promotion-candidates.md

### 5. Promotion or Standardization Change

When something becomes more reusable or more standard, review and update:

- promotion-thresholds.md
- promotion-candidates.md
- standardization-summary.md
- standard-candidates-shortlist.md
- registration-baseline.md

### 6. Rollout State Change

When a capability moves from planned to pilot, partial, active, expanding, deprecated, or retired, review and update:

- rollout-status.md
- rollout-summary.md
- parity-summary.md if needed

## Review Rule

A summary file should be updated when the underlying interpretation changes, not merely when wording changes.

Minor editorial changes do not always require summary edits.

Meaning changes do.

## Recommended Practice

After any meaningful matrix change, ask:

- which summaries now tell a comparison story
- which of those stories changed
- which summaries should now be updated

This keeps review focused.

## Relationship to Change Log

When a summary change reflects a meaningful interpretation shift, it should also be considered for entry in the matrix change log.

## Final Principle

A summary is only useful if it reflects current truth.

This layer exists so matrix summaries stay synchronized with matrix learning.
