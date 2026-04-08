# AfricaMapping Business

## Purpose

This directory contains the tenant-specific business definition for `africamapping`.

It is where the generic business framework becomes a real business model, real operating picture, and real communication surface for this tenant.

This is not platform doctrine.

This is not runtime hosting.

This is the tenant-specific business reality.

## Why This Exists

The reusable business framework provides structure.

But `africamapping` needs its own specific business meaning.

For this tenant, the system should be able to represent:

- what the business is trying to accomplish
- who it serves
- what value it creates
- how it organizes projects, programs, and activities
- how it communicates with customers, partners, staff, and operators
- how it explains itself to funders, strategic stakeholders, and institutional audiences
- how it evolves over time

This directory is the business truth layer for `africamapping`.

## Relationship to the Framework

`server-10-applications/business-framework/` is the reusable blank canvas.

`apps/africamapping/business/` is the tenant-specific version painted with real business meaning.

The framework provides the structure.

This directory provides the filled content.

## Suggested Internal Structure

```text
business/
├── README.md
├── canvas/
├── strategy/
├── communications/
└── business-model/
