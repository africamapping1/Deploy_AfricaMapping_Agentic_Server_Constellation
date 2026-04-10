# Summary Hierarchy

## Purpose

This layer defines how the many summary files of the Service Availability Matrix relate to one another.

It exists so the matrix does not become confusing as its summary layers grow.

This is the summary-hierarchy layer of the Service Availability Matrix.

## Why This Exists

The matrix now contains many summaries, including summaries for:

- readiness
- parity
- bundles
- rollout
- profile fit
- standardization
- action
- confidence
- lifecycle
- automation candidates

Without hierarchy, it becomes harder to know:

- which summary is highest-level
- which summary is more specific
- which summary should be read first
- which summary depends on which others

## Core Principle

A mature matrix can have many summaries, but they should not all operate at the same level.

There should be a readable order.

## Suggested Summary Levels

### Level 1 — Quick Operational View

These summaries are for fast understanding.

Examples:
- quick-status-board.md
- maturity-scorecard.md
- baseline-audit-summary.md

These help answer:
- where are we now
- what is strongest
- what is weakest

### Level 2 — Comparative Interpretation View

These summaries compare tenants more directly.

Examples:
- readiness-summary.md
- parity-summary.md
- bundle-summary.md
- profile-fit-summary.md
- rollout-summary.md
- lifecycle-summary.md
- confidence-summary.md

These help answer:
- how do tenants compare
- what do differences mean

### Level 3 — Forward-Looking Decision View

These summaries support planning and governance.

Examples:
- promotion-candidates.md
- standardization-summary.md
- standard-candidates-shortlist.md
- action-summary.md
- next-strengthening-priorities.md
- operational-gap-summary.md
- phase-completion-summary.md

These help answer:
- what should happen next
- what is nearing standard
- what remains weak

## Reading Order Suggestion

A good reading order is often:

1. quick-status-board.md
2. baseline-audit-summary.md
3. readiness-summary.md
4. parity-summary.md
5. profile-fit-summary.md
6. bundle-summary.md
7. promotion-candidates.md
8. standardization-summary.md
9. action-summary.md
10. next-strengthening-priorities.md

This moves from present-state understanding toward next-step governance.

## Relationship to Update Rules

Higher-level summaries often depend on lower-level logic.

That means:
- a layer change may require several summary updates
- a tenant change may ripple upward through multiple summary levels

The summary-update-rules layer should guide that maintenance.

## Final Principle

A large matrix needs navigable structure.

This layer exists so the summary system stays readable instead of becoming a pile of separate viewpoints.
