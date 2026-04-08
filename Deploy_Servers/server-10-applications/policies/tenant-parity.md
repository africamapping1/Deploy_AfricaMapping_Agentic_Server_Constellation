# Tenant Parity Policy

## Purpose

This policy defines how the platform should manage parity, availability, and controlled differences across tenant businesses.

It exists to prevent silent drift where one tenant receives a business capability, interface, service, or communication surface while another tenant is unintentionally left behind.

## Why This Exists

As the platform grows, new business capabilities will be added.

Examples may include:

- dashboards
- customer surfaces
- employee surfaces
- communication modules
- integrations
- business framework components
- workflows
- reporting layers
- AI-assisted services

Without a parity policy, the platform can become inconsistent in ways that are difficult to detect.

A tenant may be missing a service because:

- it was intentionally excluded
- it is not relevant
- it is still pending rollout
- it was forgotten by mistake

This policy ensures those differences are visible and governed.

## Core Principle

Differences between tenants must be explicit.

A tenant should never silently miss a service that the platform assumes it has.

## Parity Rule

Every significant tenant-facing capability should have a known status for every tenant.

Examples of status include:

- enabled
- disabled intentionally
- not applicable
- pending rollout
- pilot only
- deprecated
- removed

The system must be able to explain why a capability is present or absent for a given tenant.

## Service Availability Matrix

The platform should maintain a Service Availability Matrix.

This matrix should describe, for each tenant:

- what services exist
- what services are enabled
- what services are disabled
- what services are pending
- what services are not applicable
- what services are in pilot or rollout state

This matrix becomes the truth layer for capability parity.

## What Counts as a Service or Capability

This policy applies to things such as:

- business modules
- UI surfaces
- customer and employee views
- dashboards
- communications packages
- integrations
- reporting features
- workflow layers
- business-agent functions
- tenant business framework outputs

The exact catalog may expand over time.

## Allowed Differences

Not every tenant must have every capability.

Differences are allowed when they are:

- intentional
- documented
- understood
- justified by tenant type, plan, maturity, or relevance

The problem is not difference.

The problem is undocumented or accidental difference.

## Forbidden Drift

The following should be treated as parity problems:

- a capability exists for one tenant but is missing from another by accident
- a feature rollout happens without tenant impact tracking
- a removed feature leaves one tenant in an inconsistent state
- communications structures are added for one tenant but forgotten for others
- a tenant is assumed to support a surface that was never provisioned

## Registration Rule

When a new tenant is registered, it should not begin in an undefined state.

Registration should assign:

- a business template or category
- an initial capability profile
- a service availability profile
- default role surfaces
- default communications framework coverage
- parity expectations

Tenant creation should therefore be governed, not ad hoc.

## Change Management Rule

When a capability is added, changed, or removed, the system should ask:

- is this global or tenant-specific
- which tenants should receive it
- which tenants should not receive it
- is migration required
- does UI change
- do communications change
- does role access change
- does reporting change
- does doctor or governance need to validate parity afterward

Every meaningful capability change should update the Service Availability Matrix.

## Relationship to Business Framework

The business framework is reusable, but tenant activation may differ.

For example:

- one tenant may have investor messaging
- another tenant may not need it yet
- one tenant may have customer and employee dashboards
- another may only have internal surfaces
- one tenant may have certain communications modules in active use
- another may still be in a partial rollout state

This is acceptable if it is explicit.

## Relationship to Governance

Governance should be able to inspect parity status.

That means parity should eventually be visible through:

- reports
- audits
- doctor checks
- rollout checks
- service availability review

Parity is therefore both an application concern and a governance concern.

## Relationship to Doctor

System Doctor or a future parity-check tool should eventually be able to answer questions such as:

- which services are enabled for each tenant
- where tenant capability drift exists
- whether a missing capability is intentional or accidental
- whether rollout expectations match actual availability

## Recommended Future Structures

Examples of future implementation structures may include:

```text
server-10-applications/
├── service-catalog/
├── capability-bundles/
├── registration/
├── provisioning/
└── policies/
