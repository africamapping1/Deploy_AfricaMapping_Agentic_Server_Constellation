# Platform–Application Boundary Policy

## Purpose

This policy defines the separation of concerns between:

- the Agentic Server Constellation platform
- the applications, workloads, and agent systems that use it

This boundary exists to protect platform stability, governance, and long-term evolution.

## Core Rule

The platform is not an application.

Applications are not allowed to alter the platform's constitutional, lifecycle, deployment, or state mechanisms unless explicitly governed and approved.

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

These responsibilities primarily live in:

- `server-00-foundation`
- `server-05-ci-cd`
- `server-06-monitoring`
- shared platform lifecycle and policy documents

## Application Responsibilities

Applications are responsible for:

- domain logic
- business rules
- user-facing behavior
- workload-specific data handling
- AI task execution specific to the application
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
- an application creates an event
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
- application independence
- safe multi-product use
- reduced spillover risk
- long-term architectural integrity

## Final Principle

The constellation is the platform.

Applications are guests.

Guests may operate within the house.

Guests may not rewrite the foundation.
