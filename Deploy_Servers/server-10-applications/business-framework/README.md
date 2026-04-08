# Business Framework

## Purpose

The business framework is the reusable business intelligence layer of the application plane.

It exists so the system can understand, model, compare, communicate, and evolve businesses without confusing business logic with platform doctrine.

This framework is generic.

It is not one tenant’s business.

It is the reusable canvas, model set, and communication structure that tenant businesses can use.

## Why This Exists

A governed platform can execute flows and policies.

But real application value also depends on understanding businesses as living systems.

That means the system must be able to reason about:

- what a business is
- how it creates value
- who it serves
- how it operates
- how it communicates
- how it grows
- how it explains itself to the outside world

This framework provides that layer.

## Core Principle

The business framework is the blank canvas.

Each tenant business paints its own version on top of it.

The framework provides reusable structure.

The tenant provides real meaning.

## What Belongs Here

The business framework should contain reusable business thinking structures such as:

- perspectives
- canvases
- business model frameworks
- operating models
- value proposition structures
- communication frameworks
- strategic templates
- narrative templates
- evaluation lenses

## Suggested Internal Structure

```text
business-framework/
├── README.md
├── perspectives/
├── canvases/
├── business-model/
│   └── nine-building-blocks/
├── communications/
│   ├── elevator-pitch/
│   ├── investor-pitch/
│   ├── customer-messaging/
│   ├── partner-messaging/
│   ├── internal-messaging/
│   ├── objection-handling/
│   └── narrative-frames/
└── templates/
