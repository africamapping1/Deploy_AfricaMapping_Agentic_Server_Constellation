# Service Availability Matrix

## Purpose

The Service Availability Matrix is the control layer that tracks what business capabilities, structures, surfaces, and services exist across tenants.

It exists to prevent silent drift.

It helps the system answer not only whether something exists, but also:

- how mature it is
- whether it is reusable
- whether it is tenant-specific
- whether it should become common structure
- whether parity is intentional or missing

## Why This Exists

As the platform grows, tenants will not always evolve at the same speed.

One tenant may receive:

- a business canvas
- a communication module
- a dashboard
- a user surface
- a strategy layer
- a service package

while another tenant may:

- not have it yet
- not need it
- have an older version
- be missing it by mistake

Without a matrix, those differences become hard to understand.

With a matrix, the platform can see:

- what is present
- what is absent
- what is mature
- what is reproducible
- what is becoming standard

## Core Principle

The matrix is not only a presence checklist.

It is a maturity and reproducibility control system.

It should help the platform learn:

- what is tenant-specific
- what is common across tenants
- what is strong enough to become reusable
- what should move upward into the shared business framework
- what should become application-plane standard

## What the Matrix Should Answer

The matrix should be able to answer questions such as:

- does this tenant have this capability
- how complete is it
- is it only scaffolded or fully real
- is it comparable to another tenant’s version
- is it reusable across tenants
- is it now strong enough to become shared framework
- is it intentionally absent or accidentally missing

## Maturity Logic

Each line in the matrix should eventually be judged by more than yes or no.

Useful maturity states may include:

- missing
- placeholder
- scaffolded
- documented
- partially implemented
- implemented
- operational
- reusable
- standardized
- tenant-specific only

These states help the platform distinguish between existence and readiness.

## Layered Matrix Logic

The matrix should be layered, not flat.

### Layer 1 — Tenant Business Minimums

Checks whether each tenant has the minimum business-definition structures.

Examples include:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README

### Layer 2 — Communications Maturity

Checks whether each tenant has communication structures that allow it to explain itself clearly.

Examples include:

- elevator pitch
- investor pitch
- stakeholder pitch
- positioning
- operator explanation
- objection handling

### Layer 3 — Business Model Maturity

Checks whether each tenant has business-model depth.

Examples include:

- customer or stakeholder segments
- value proposition
- channels
- relationships
- revenue or funding logic
- key resources
- key activities
- key partners
- cost structure

### Layer 4 — Surface Availability

Checks whether each tenant has user-facing or operator-facing service surfaces.

Examples include:

- website
- UI
- dashboards
- customer view
- employee view
- business role surfaces
- integrations

### Layer 5 — Reusable Extraction

Checks whether a capability that appears in one tenant is now strong enough to become reusable or standard.

Examples of questions:

- is this tenant-only
- is this similar across tenants
- should this move into shared business-framework
- should this become application-plane standard
- should this become a capability bundle for future tenants

## Learning Function

The matrix should not only report status.

It should teach the system.

For example, if two tenants both have:

- business README
- canvas overview
- strategy README
- business-model README
- at least one short-form pitch

then the system learns that these are likely part of the minimum tenant business baseline.

That means the matrix can help convert repeated practice into platform standard.

## Relationship to Tenant Parity

Tenant parity does not mean every tenant must be identical.

It means differences must be visible, intentional, and explainable.

The matrix should therefore support parity by showing:

- what is shared
- what is different
- why it is different
- whether the difference is temporary, intentional, or accidental

## Relationship to the Shared Business Framework

The matrix should help determine what belongs in:

- tenant business spaces
- shared reusable business intelligence
- application-plane standard structures

If something appears repeatedly across tenants and reaches enough maturity, it may be promoted upward into the shared business framework.

## Relationship to Registration and Growth

As new businesses are added later, the matrix should become part of onboarding and growth governance.

A new tenant should eventually be registered with:

- an initial capability baseline
- an expected business minimum set
- a communications minimum set
- a business-model minimum set
- a surface availability profile

That way new businesses do not start in an undefined state.

## Suggested Structure

```text
service-availability-matrix/
├── README.md
├── layers/
│   ├── tenant-business-minimums.md
│   ├── communications-maturity.md
│   ├── business-model-maturity.md
│   ├── surface-availability.md
│   └── reusable-extraction.md
└── tenants/
    ├── africamapping.md
    └── realestate-ai.md
