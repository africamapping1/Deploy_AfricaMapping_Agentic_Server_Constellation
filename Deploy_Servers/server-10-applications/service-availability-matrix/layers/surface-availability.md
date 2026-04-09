# Surface Availability

## Purpose

This layer defines how the platform should evaluate the visible service and interface surfaces available to each tenant.

It exists so the system can distinguish between a tenant that has internal business structure only and a tenant that also has usable delivery, interaction, and role-facing surfaces.

This is the surface layer of the Service Availability Matrix.

## Why This Exists

A tenant may have strong business documentation and still be weak in actual visible service presence.

For example, a tenant may have:

- business README
- canvas overview
- communications files
- strategy files

but still lack:

- website
- UI
- dashboard access
- customer view
- employee view
- role-facing service surfaces

This layer helps the platform see whether the business is not only defined, but also surfaced.

## Core Principle

Surface availability is about where the business becomes visible, usable, or interactive.

A tenant is more mature when it not only has business definition, but also meaningful service surfaces.

## Typical Surface Types

Surface availability may include things such as:

- website
- user interface
- dashboards
- customer-facing views
- employee-facing views
- role-based operational views
- integrations that expose service value
- business-facing reporting surfaces

Not every tenant needs every surface.

But the system should know what exists and why.

## Minimum Surface Baseline

At this stage, there is no single mandatory surface package for all tenants.

However, every tenant should eventually be evaluated for at least the following categories:

### 1. Website Presence
Does the tenant have a website subtree or equivalent public-facing surface?

### 2. User Interface Presence
Does the tenant have a UI or application interaction surface?

### 3. Dashboard Presence
Does the tenant have dashboard visibility where appropriate?

### 4. Role Surface Presence
Does the tenant have customer, employee, operator, or stakeholder-facing surfaces where relevant?

## Maturity Logic

Useful maturity states for surface items may include:

- missing
- placeholder
- scaffolded
- documented
- implemented
- operational

This helps the platform distinguish between an empty folder, a defined surface, and a live operating one.

## Tenant-Type Rule

Not all tenants need the same surface mix.

For example:

- one tenant may need customer and employee dashboards
- another may need stakeholder and partner surfaces
- one may require CRM, finance, and geospatial service areas
- another may focus on portfolio and user-facing application views

This means the matrix should measure fit, not forced sameness.

## Comparison Rule

This layer should support questions such as:

- which tenants have website presence
- which tenants have role-based user surfaces
- which tenants have dashboard presence
- which tenants have only scaffolded surfaces
- where service visibility differs intentionally or accidentally

## Reproducibility Logic

If certain surface patterns appear repeatedly across tenants, they may become candidates for:

- shared capability bundles
- standard tenant service packages
- future registration defaults
- parity checks

Examples may include:

- tenant website presence
- tenant dashboard presence
- tenant communications plus surface package
- role-based user surface package

## Relationship to Tenant Parity

This layer is one of the most important places where parity drift can happen.

A tenant may silently gain or miss a surface.

The matrix should make that visible.

Differences are acceptable when they are:

- intentional
- documented
- appropriate to tenant type

Differences are a problem when they are accidental or forgotten.

## Relationship to Future Registration

As future tenants are added, this layer should help determine what surfaces are provisioned by default and what surfaces are optional.

That means this layer will later influence:

- onboarding defaults
- service bundles
- tenant category templates
- rollout planning

## Final Principle

A tenant business is more complete when it is not only described, but also surfaced.

This layer exists to make service visibility and interface maturity explicit.
