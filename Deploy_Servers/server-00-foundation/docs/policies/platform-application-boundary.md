# Platform–Application Boundary Policy

## Purpose

This policy defines the separation of concerns between:

- the ASC platform (Agentic Server Constellation)
- the tenant applications, business workloads, and agent systems that run on it

This boundary exists to protect platform stability, governance, and long-term evolution.

> Note: ASC is the platform identity. AfricaMapping, RealEstate AI, and future businesses are tenants on the platform.
> Current runtime paths such as `/opt/africamapping` remain legacy operational roots still in use and may be migrated later.

## Core Rule

The platform is not an application.

Applications, tenant workloads, and business agent systems are not allowed to alter the platform’s constitutional, lifecycle, deployment, or state mechanisms unless explicitly governed and approved.

## Platform Responsibilities

The platform is responsible for:

- lifecycle definition
- deployment and landing
- heartbeat and deployment state
- server role structure
- flow framework
- governance rules
- observability framework
- policy enforcement
- shared schemas and standards
- platform diagnostics and health interpretation

These responsibilities primarily live in:

- `server-00-foundation`
- `server-05-ci-cd`
- `server-06-monitoring`
- `server-07-ai-orchestrator`
- shared platform lifecycle, governance, and policy documents

## Application Responsibilities

Tenant applications and business workloads are responsible for:

- domain logic
- business rules
- user-facing behavior
- workload-specific data handling
- AI task execution specific to the tenant or application
- product-specific workflows

Applications must be layered on top of the platform, not mixed into the platform.

## Forbidden Actions

Applications and workload teams must NOT:

- modify platform lifecycle files
- overwrite deployment scripts
- change heartbeat or deployment-state records directly
- alter foundational server roles without governance approval
- write business-specific logic into foundation docs
- bypass governed flows
- store domain-specific logic in platform state directories

## Allowed Integration Pattern

Applications SHOULD:

- use defined flows
- use approved runtime locations
- write through governed interfaces
- respect platform observability and policy
- remain separable from the platform

## Example

Correct:
- a tenant application creates an event
- the event enters a governed flow
- the platform routes, observes, and records it

Incorrect:
- an application writes directly into `/opt/africamapping/deployment-state/`
- an application edits bootstrap scripts
- an application modifies heartbeat logic to suit its own behavior

## Governance Path for Exceptions

If an application needs deeper integration, it must go through:

- proposal
- review
- governance decision
- approved implementation path

This keeps the constellation stable while still allowing evolution.

## Outcome

This policy ensures:

- platform cleanliness
- tenant/application independence
- safe multi-product use
- reduced spillover risk
- long-term architectural integrity

## Final Principle

ASC is the platform boundary.

Tenant applications and business systems may operate within the platform.

They may not rewrite the platform itself.
