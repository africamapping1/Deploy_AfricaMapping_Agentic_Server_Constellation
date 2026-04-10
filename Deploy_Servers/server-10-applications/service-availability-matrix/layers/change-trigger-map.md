# Change Trigger Map

## Purpose

This layer defines which kinds of platform changes should trigger review of which Service Availability Matrix areas.

It exists so the platform can respond to meaningful change without reviewing everything every time.

This is the trigger-mapping layer of the Service Availability Matrix.

## Why This Exists

Not every change affects every part of the matrix.

A small tenant communication change does not necessarily require:
- full bundle review
- full standardization review
- full profile reassessment

This layer helps the platform map change types to the right review scope.

## Core Principle

Review scope should follow impact scope.

The platform should review what changed meaningfully, not everything blindly.

## Trigger Types

### 1. Tenant Baseline Change
Examples:
- tenant README added or removed
- business README added or removed
- business-model README added or removed
- canvas overview added or removed
- communications README added or removed
- strategy README added or removed

Typical review targets:
- baseline-check logic
- baseline-audit summary
- readiness summary
- registration-decision summary

### 2. Communication Change
Examples:
- elevator pitch added
- stakeholder pitch added
- investor pitch added
- positioning added

Typical review targets:
- communications-maturity
- readiness summary
- confidence summary
- action summary

### 3. Surface Change
Examples:
- new UI added
- dashboard area added
- operations area added
- user-facing surface added

Typical review targets:
- surface-availability
- profile-fit summary
- parity summary
- bundle summary

### 4. Profile-Relevant Change
Examples:
- customer/employee logic added to stakeholder tenant
- stakeholder/service-module grouping added to role-surface tenant

Typical review targets:
- profile-fit summary
- profile-drift watchlist
- parity summary
- registration profiles

### 5. Bundle-Relevant Change
Examples:
- repeated grouped capability appears
- bundle becomes clearer
- bundle weakens or disappears

Typical review targets:
- capability-bundles
- bundle states
- bundle summaries
- promotion candidates

### 6. Standardization-Relevant Change
Examples:
- repeated pattern becomes stable
- baseline expands
- onboarding default is reconsidered

Typical review targets:
- promotion thresholds
- standardization summary
- standard candidates shortlist
- registration baseline

## Final Principle

Change should trigger the right review, not random review.

This layer exists so the matrix can respond proportionately and efficiently.
