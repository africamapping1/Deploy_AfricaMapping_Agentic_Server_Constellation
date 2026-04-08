# RealEstate AI Communications

## Purpose

This directory contains the tenant-specific communication layer for `realestate-ai`.

It is where the business learns to explain itself clearly across different audiences, situations, and levels of detail.

This is not generic framework logic.

This is the real communication surface of the tenant.

## Why This Exists

A business that cannot communicate clearly is difficult to trust, scale, sell, or support.

`realestate-ai` needs a place where its business story becomes usable in live contexts such as:

- customer explanation
- investor explanation
- operator explanation
- portfolio explanation
- partner discussion
- internal alignment

This directory exists so the tenant can speak coherently from its own business truth.

## Relationship to the Framework

`server-10-applications/business-framework/communications/` contains the reusable communication structure.

`apps/realestate-ai/business/communications/` contains the tenant-specific implementation of that structure.

The framework provides the communication architecture.

This directory provides the real business messaging.

## Suggested Internal Structure

```text
communications/
├── README.md
├── elevator-pitch.md
├── investor-pitch.md
├── customer-story.md
├── operator-explanation.md
├── positioning.md
└── objection-handling.md
