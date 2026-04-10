# File Naming Discipline

## Purpose

This layer defines naming discipline for Service Availability Matrix files.

It exists so the matrix remains readable, predictable, and easier to automate against later.

This is the naming-discipline layer of the Service Availability Matrix.

## Why This Exists

A matrix of this size becomes harder to maintain if file naming drifts.

Good naming improves:

- readability
- summary hierarchy
- future script matching
- review consistency
- typo detection

## Core Principle

Matrix file names should be descriptive, stable, and low-ambiguity.

## Recommended Naming Rules

### 1. Use Lowercase Kebab-Case
Examples:
- `registration-readiness.md`
- `profile-aware-parity.md`
- `bundle-states-summary.md`

### 2. Prefer Noun-Phrase Meaning
A file name should clearly suggest what the file is about.

Examples:
- `readiness-summary.md`
- `promotion-candidates.md`
- `current-state-one-page.md`

### 3. Keep Summary Names Explicit
If a file is a summary, include that clearly.

Examples:
- `parity-summary.md`
- `rollout-summary.md`
- `confidence-summary.md`

### 4. Keep Layer Names Conceptual
Layer files should usually describe logic, interpretation, or policy.

Examples:
- `promotion-thresholds.md`
- `baseline-check-logic.md`
- `automation-readiness.md`

### 5. Keep Tenant Files Tenant-Scoped
Files in `tenants/` should clearly indicate whether they are:
- tenant-specific
- comparative summary
- operational checklist
- decision board

## Anti-Patterns

Avoid:
- inconsistent extensions
- vague names like `notes.md`
- duplicated meanings under different names
- filenames that differ only slightly without clear reason

## Current Hygiene Reminder

A filename typo such as:
- `parity-summary.mc`

should be corrected to:
- `parity-summary.md`

This kind of cleanup matters because naming discipline supports future automation and review reliability.

## Final Principle

A strong matrix should be easy to navigate by name alone.

This layer exists so naming stays disciplined as the matrix grows.
