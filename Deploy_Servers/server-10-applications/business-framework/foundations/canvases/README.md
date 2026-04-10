# Business Canvases

## Purpose

This directory contains the reusable canvas structures of the business framework.

A canvas is a structured business view that helps the system understand a business as a whole, not only as isolated files, activities, or modules.

These canvases are reusable.

They are not one tenant’s completed business picture.

They are the blank structured views that tenant businesses can fill with real meaning.

## Why This Exists

A business is easier to govern and communicate when it can be seen as a coherent whole.

Raw files, projects, dashboards, and workflows can show fragments of reality.

A canvas helps connect those fragments into a recognizable business picture.

This makes it easier to understand:

- what the business is
- what it is trying to achieve
- how its work is organized
- how it creates value
- how its parts relate
- how it should be explained to others

## Core Principle

A canvas is the business seen as a whole.

It is not the same as the detailed business model.

It is not the same as strategy.

It is not the same as communications.

It is the structured overview that helps hold those together.

## What Belongs Here

Reusable canvas structures may include:

- business overview canvas
- stakeholder perspective canvas
- operating perspective canvas
- strategic perspective canvas
- service perspective canvas
- growth perspective canvas
- governance-sensitive business overview
- role-based business views

The exact set of canvases may evolve as the framework matures.

## Relationship to the Business Model

The business model explains structural business truth.

The canvas explains the broader business picture.

Example:

- the business model may define customer segments and value propositions
- the canvas may show how the business is positioned overall and how those parts fit together

The model is more structural.

The canvas is more holistic.

## Relationship to Communications

The communications layer speaks from the canvas.

A good pitch should not come from nowhere.

It should reflect a real business picture.

That means the canvas helps anchor:

- elevator pitch
- investor pitch
- stakeholder explanation
- customer-facing explanation
- internal explanation

If the canvas changes, communications may need to change as well.

## Relationship to Tenants

Each tenant should create tenant-specific canvases under its own business directory.

Examples:

- `apps/africamapping/business/canvas/`
- `apps/realestate-ai/business/canvas/`

Those tenant canvas files are where the reusable canvas logic becomes real business meaning.

## Relationship to the Business-Agent

The business-agent should be able to speak and reason from a tenant’s canvas.

That means the canvas helps the agent understand:

- what business it is representing
- what matters most
- what picture should be communicated
- what operating logic should remain coherent

The agent should not improvise a full business picture without grounding in the tenant canvas.

## Canvas Quality Rule

A useful canvas should be:

- clear
- coherent
- non-fragmented
- useful to humans
- useful to agents
- aligned with the business model and communications

A weak canvas is one that is too vague, too abstract, or disconnected from how the business actually operates.

## Final Principle

The canvas is the painted whole-business view.

It allows the system to understand a tenant business as a meaningful entity, not only as scattered structures and files.
