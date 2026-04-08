# AfricaMapping Business Model

## Purpose

This directory contains the tenant-specific business model for `africamapping`.

It is where the structural logic of the business is defined in a reusable and understandable way.

This is not platform doctrine.

This is not runtime configuration.

This is the business structure of the tenant.

## Why This Exists

A business should not be represented only through scattered projects, activities, and programs.

The system needs a structured view of:

- who the business serves
- what value it provides
- how it reaches people and institutions
- how relationships are maintained
- how value is captured or sustained
- what resources and activities are essential
- what partnerships matter
- what cost structure supports the work

This directory exists to hold that structural truth for `africamapping`.

## Relationship to the Framework

`server-10-applications/business-framework/business-model/` provides the reusable model structure.

`apps/africamapping/business/business-model/` contains the tenant-specific version of that structure.

The framework gives the business model language.

This directory gives it tenant-specific meaning.

## Suggested Internal Structure

```text
business-model/
├── README.md
├── customer-segments.md
├── value-proposition.md
├── channels.md
├── customer-relationships.md
├── revenue-or-funding.md
├── key-resources.md
├── key-activities.md
├── key-partners.md
└── cost-structure.md
