# Tenant Risk Categories

## Purpose

This layer defines the main risk categories the Service Availability Matrix should help the platform observe across tenants.

It exists so matrix findings can be interpreted through meaningful risk types instead of only file absence.

This is the tenant-risk layer of the Service Availability Matrix.

## Why This Exists

A tenant can be weak in different ways.

Examples:
- baseline weakness
- unclear profile fit
- weak communications maturity
- surface ambiguity
- bundle incompleteness
- promotion confusion

Grouping these as risk categories helps governance think more clearly.

## Core Principle

Different weaknesses should be understood as different risk types.

## Suggested Risk Categories

### 1. Baseline Risk
The tenant may be missing a current minimum business baseline item.

### 2. Readiness Risk
The tenant may not be clearly baseline-ready or registration-ready.

### 3. Profile Risk
The tenant’s strongest profile fit may be unclear, stale, or drifting.

### 4. Parity Risk
The tenant may be under-built relative to shared baseline or its profile.

### 5. Surface Risk
The tenant’s visible business/service surfaces may be unclear or incomplete.

### 6. Bundle Risk
The tenant may have an incomplete or weakly understood bundle pattern.

### 7. Standardization Risk
The tenant may be teaching the platform something that is still too weak or too early to standardize safely.

### 8. Operationalization Risk
The matrix may understand the tenant, but the platform may not yet be using that understanding operationally enough.

## Relationship to Severity

Risk category explains the kind of problem.

Severity explains how serious it currently is.

The two should work together.

## Final Principle

A matrix becomes more useful when it helps the platform see not only that something is weak, but what kind of weakness it is.

This layer exists so tenant risk stays more interpretable.
