# Tenant Registration Baseline

## Purpose

This file defines the baseline structures and service expectations that a new tenant should receive at registration time.

It exists so future tenant creation does not begin from an undefined or inconsistent state.

This is the bridge between:

- what the Service Availability Matrix has learned
- what future tenant onboarding should provision by default

## Why This Exists

The platform is beginning to learn repeatable tenant patterns.

From current tenant comparisons, several common baseline elements are already visible, including business structure, communication structure, and minimum tenant readability. :contentReference[oaicite:0]{index=0}

Without a registration baseline, future tenants would risk:

- inconsistent setup
- missing business foundations
- unclear communications readiness
- uneven parity from day one
- ad hoc manual decisions

This file defines the starting line.

## Core Principle

A new tenant should not start from zero.

A new tenant should start from a governed baseline that is:

- understandable
- comparable
- extensible
- parity-aware
- suitable for future growth

## Baseline Categories

### 1. Tenant Identity Baseline

Each new tenant should receive:

- tenant root README
- tenant business directory
- tenant business README

This ensures the tenant has a defined identity and business anchor from the start.

### 2. Minimum Business Structure Baseline

Each new tenant should receive:

- `business/business-model/README.md`
- `business/canvas/overview.md`
- `business/communications/README.md`
- `business/strategy/README.md`

These are the current minimum business-definition components that now appear across the first modeled tenants.

### 3. Minimum Communication Baseline

Each new tenant should receive:

- one short-form pitch
- one deeper audience-facing communication file

Examples:

- elevator pitch
- stakeholder pitch
- investor pitch
- customer explanation
- partner explanation

The exact deeper communication type may vary by tenant type.

### 4. Surface Baseline

Each new tenant should be evaluated for:

- website presence
- UI presence
- dashboard expectations
- role-surface needs
- user type expectations

Not every tenant must receive all surfaces immediately.

But every tenant should receive an explicit surface profile.

### 5. Matrix Enrollment Baseline

Each new tenant should automatically receive:

- a tenant matrix file
- baseline maturity statuses
- parity tracking visibility
- next-action placeholders

This ensures the tenant becomes visible inside the Service Availability Matrix from the start.

## Baseline Status Types

At registration time, each baseline item should be assigned a starting status such as:

- provisioned
- scaffolded
- documented
- pending
- not applicable

This allows the platform to distinguish between what has been created, what still needs tenant-specific completion, and what is intentionally out of scope.

## Tenant-Type Adaptation Rule

Registration should not force every tenant into the same exact form.

Instead, onboarding should choose a baseline profile based on tenant type, business type, or service pattern.

Examples may include:

- stakeholder-heavy tenant
- investor-facing tenant
- customer-and-employee tenant
- service-module-heavy tenant
- integration-heavy tenant

The baseline should therefore be standardized, but adaptable.

## What the Matrix Has Already Taught

The first modeled tenants suggest that the following are strong candidates for universal tenant baseline:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- one short-form pitch
- one deeper audience-facing communication

These are now strong candidates for future registration defaults.

## Relationship to Reusable Extraction

This file depends on the reusable-extraction layer.

As more tenants are added, the baseline should evolve based on what repeatedly proves useful, comparable, and stable.

That means this registration baseline is not frozen forever.

It should mature as the platform learns.

## Relationship to Parity

A proper registration baseline improves tenant parity because it ensures new tenants do not begin with accidental structural disadvantages.

It does not guarantee identical tenants.

It guarantees a fair and explainable starting structure.

## Relationship to Future UI Onboarding

When future tenant registration becomes UI-driven, this baseline should guide the onboarding flow.

The registration process should eventually be able to assign:

- business baseline package
- communication baseline package
- surface baseline package
- parity visibility status
- service availability profile

That means the UI should provision a tenant from governed defaults, not from memory.

## Suggested Future Output of Registration

A future registered tenant should ideally begin with:

```text
apps/<tenant>/
├── README.md
├── business/
│   ├── README.md
│   ├── business-model/
│   │   └── README.md
│   ├── canvas/
│   │   └── overview.md
│   ├── communications/
│   │   ├── README.md
│   │   ├── elevator-pitch.md
│   │   └── <audience-pitch>.md
│   └── strategy/
│       └── README.md
