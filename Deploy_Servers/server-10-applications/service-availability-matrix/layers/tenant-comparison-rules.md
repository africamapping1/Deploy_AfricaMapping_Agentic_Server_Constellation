# Tenant Comparison Rules

## Purpose

This layer defines how tenants should be compared through the Service Availability Matrix.

It exists so comparison remains fair, profile-aware, and evidence-based.

This is the tenant-comparison layer of the Service Availability Matrix.

## Why This Exists

The matrix is built to compare tenants.

But comparison can become misleading if it ignores:

- lifecycle stage
- profile differences
- rollout state
- valid exceptions
- tenant-type patterns

This layer defines better comparison rules.

## Core Principle

Tenants should be compared by shared baseline first, then by profile fit, then by bundle and surface logic.

Comparison should move from common ground toward specialized difference.

## Recommended Comparison Order

### 1. Shared Baseline Comparison
Ask:
- do both tenants satisfy the current minimum baseline
- is one tenant missing a baseline item

This is the strongest first comparison.

### 2. Readiness Comparison
Ask:
- are both tenants baseline-ready
- are both registration-ready
- is one tenant still earlier in maturity

### 3. Profile Fit Comparison
Ask:
- what profile best fits each tenant
- are the tenants even meant to be the same type

This avoids false sameness.

### 4. Bundle Comparison
Ask:
- what bundle pattern is strongest in each tenant
- is the bundle expected for that tenant type
- is absence valid or concerning

### 5. Surface Comparison
Ask:
- what service surfaces are visible
- are they profile-appropriate
- is one tenant under-built for its own profile

## What Good Comparison Avoids

Good comparison should avoid:
- comparing advanced optional items before checking baseline
- calling profile-based difference a defect
- assuming one tenant’s strengths must automatically appear in another
- ignoring lifecycle stage

## Acceptable Comparison Outcomes

A comparison may conclude:

- aligned on baseline
- comparable but different by profile
- stronger in different dimensions
- not yet fairly comparable
- likely drift in one area
- emerging standard across both

These are more useful than simple same/different labels.

## Relationship to Parity

Parity depends on good comparison.

If comparison is poor, parity becomes poor.

That means comparison rules are one of the foundations of fair parity.

## Final Principle

A mature platform compares tenants in the right order and with the right lens.

This layer exists so tenant comparison stays intelligent instead of simplistic.
