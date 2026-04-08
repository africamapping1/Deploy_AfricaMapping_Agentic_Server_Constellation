
## `Deploy_Servers/server-10-applications/policies/app-boundary.md`

```md
# Application Boundary Policy

## Purpose

This policy defines the boundary between:

- ASC core platform responsibilities
- application-plane responsibilities
- tenant business responsibilities

It exists to prevent application growth from polluting platform governance and deployment truth.

## Core Rule

Applications are not the platform.

The platform is not a tenant business.

The application plane must remain distinct from both.

## ASC Core Responsibilities

ASC core is responsible for:

- governance
- lifecycle orchestration
- deployment state
- settled state
- flows framework
- observability
- narrator
- strategist
- doctor
- worker orchestration
- platform-wide standards and rules

These concerns remain in the platform layer.

## Application Plane Responsibilities

The application plane is responsible for:

- application definitions
- tenant app structure
- business-facing modules
- business framework models
- tenant business canvases
- communication frameworks
- application contracts and interfaces
- application admission structures

These concerns belong in `server-10-applications`.

## Tenant Responsibilities

Each tenant is responsible for its own business-specific content, such as:

- value proposition
- customer segments
- operating focus
- business positioning
- tenant-specific communications
- tenant-specific offerings and service structure

Tenant content should live inside tenant application space, not platform doctrine.

## Runtime Responsibilities

Runtime hosting remains separate.

Runtime hosting includes:

- nginx
- systemd
- deployment wrappers
- runtime bootstrap
- runtime hardening
- runtime operations

These concerns belong in `server-02-app`, not in `server-10-applications`.

## Forbidden Mixing

Applications and tenants must not:

- rewrite platform lifecycle rules
- rewrite deployment-state logic
- redefine settled-state truth
- change doctor/narrator/governor logic from tenant space
- place tenant business doctrine inside ASC core policy directories
- treat runtime deployment wrappers as business model structures

The platform must not:

- absorb tenant-specific business canvases into foundation doctrine
- store tenant communication strategy as platform law
- confuse business-specific logic with universal governance logic

## Business Framework Rule

The business framework belongs in the application plane.

This includes:

- perspectives
- canvases
- business-model structures
- nine building blocks
- communications frameworks
- narrative templates

These are reusable application/business tools, not core platform doctrine.

## Persona Rule

The speaking actor and the business model must remain distinct.

- business model = what the business is
- business-agent persona = how the system speaks and acts for that business

The business model belongs in the application plane.

The persona belongs in the AI worker layer.

## Allowed Integration

Applications may:

- consume governed platform flows
- use platform observability
- use platform agent orchestration
- use shared platform standards
- expose tenant business structures through governed interfaces

## Final Principle

ASC is the governed house.

`server-10-applications` is the application and business wing.

Tenants live inside that wing.

The business-agent may speak for them.

But none of them may rewrite the foundation.
