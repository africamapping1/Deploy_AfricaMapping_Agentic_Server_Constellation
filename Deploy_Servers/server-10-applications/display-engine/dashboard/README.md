# Dashboard

## Purpose

This folder defines the manual user dashboard layer of the display engine.

It exists so human users can configure and control display behavior without depending on AI.

## Main Idea

The dashboard is the manual control surface of the display engine.

It should allow users to configure how a display behaves for a specific project, tenant, or workflow.

## Manual Configuration Goals

Manual users should eventually be able to configure things such as:

- basemap selection
- visible layers
- startup zoom
- startup center
- 2D or 3D mode
- coordinate system
- transformation behavior
- widget visibility
- display profile selection

## Relationship to the Engine

The dashboard should not replace the engine.

It should configure the engine.

That means dashboard actions should update reusable engine state rather than create isolated viewer-specific logic.

## Relationship to AI

The dashboard exists for manual mode first.

Later, AI may assist by:

- proposing profiles
- proposing widget sets
- suggesting display settings
- interpreting project needs

But the dashboard should remain usable even without AI.

## Final Principle

The dashboard is the manual configuration surface of the display engine.
