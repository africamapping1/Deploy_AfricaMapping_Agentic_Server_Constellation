# Matrix Boundaries

## Purpose

This layer defines what the Service Availability Matrix should cover and what it should not try to absorb.

It exists so the matrix remains useful and does not grow into an undisciplined catch-all system.

This is the boundary layer of the Service Availability Matrix.

## Why This Exists

As the matrix grows, it becomes tempting to use it for everything.

But the matrix is strongest when it focuses on:

- tenant baseline
- readiness
- parity
- profile fit
- bundle visibility
- promotion and standardization signals
- onboarding relevance

If it tries to absorb every possible platform concern, it will become noisy and weak.

## Core Principle

The matrix should describe tenant business availability, maturity, comparability, and growth logic.

It should not replace every other part of the platform.

## What the Matrix Should Cover

The matrix should cover things such as:

- tenant business minimums
- communications maturity
- business-model maturity
- surface availability
- reusable extraction
- readiness
- bundle maturity
- profile fit
- parity meaning
- rollout meaning
- promotion candidates
- registration profile relevance

## What the Matrix Should Not Replace

The matrix should not replace:

### 1. Platform Runtime Truth
Examples:
- deployment state
- settled state
- runtime health
- server uptime
- low-level system operations

These belong elsewhere in platform operations and doctor logic.

### 2. Business Content Itself
Examples:
- full business strategy
- full communication bodies
- full tenant project content

These belong in tenant business directories and framework directories.

### 3. Governance Decision Records
Examples:
- final approvals
- ADRs
- formal governance decisions

The matrix may inform those, but should not replace them.

### 4. Detailed Provisioning Scripts
The matrix may guide provisioning, but should not become the provisioning engine itself.

## Relationship to Server-10

Within server-10, the matrix is one major business/governance socket.

It should work with:
- apps/
- business-framework/
- policies/
- intake/
- interfaces/
- flows/

But it should not absorb all their responsibilities.

## Why Boundaries Matter

Without boundaries, the matrix may become:

- too large
- too ambiguous
- too repetitive
- too hard to maintain

Good boundaries preserve clarity.

## Final Principle

A useful matrix has scope.

This layer exists so the Service Availability Matrix grows with discipline rather than trying to become everything at once.
