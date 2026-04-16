# Display Manager Role

## Purpose

This file defines the display manager role within the display engine.

It exists so display configuration is treated as an intentional responsibility rather than as ad hoc viewer setup.

The display manager is responsible for shaping how a project, tenant, or workflow is presented through the display engine.

---

## Why This Role Exists

The display engine is not only a map viewer.

It is a display configuration system.

That means someone or something must define:

- what users see
- how users see it
- what defaults apply
- what interactions are allowed
- what display behavior becomes standard for a project

Without this role, display behavior becomes inconsistent across teams and projects.

---

## Core Responsibility

The display manager defines, maintains, and applies display profiles.

This includes deciding things such as:

- official basemap
- official startup extent
- official zoom defaults
- official visible layers
- official popup behavior
- official coordinate system
- official transformation behavior
- official widget set
- official interaction rules

---

## Main Activities

A display manager may perform activities such as:

- creating a new display profile
- editing an existing display profile
- selecting which profile applies to a project
- reviewing display consistency
- approving changes to display behavior
- coordinating with GIS, project, or tenant teams
- preparing profiles for manual users
- preparing profiles for AI-assisted workflows later

---

## Relationship to the Display Profile Schema

The display manager works against the shared display profile schema.

This means the role should not invent isolated display behavior outside the schema.

The role should create or manage profiles using defined sections such as:

- identity
- map
- basemap
- projection
- layers
- widgets
- interaction
- styling

---

## Relationship to MVC

Within the display engine:

- the **display profile** is part of the **model**
- the **viewer surfaces** are the **view**
- the **application of profile choices** is part of the **controller**

The display manager mainly works through the model, and indirectly affects the view by shaping the configuration that controllers apply.

---

## Relationship to Manual Dashboard

In manual mode, the display manager may use the dashboard to:

- select a profile
- adjust a profile
- review a profile before use
- standardize a project display configuration

The dashboard is therefore one working surface for the display manager.

---

## Relationship to AI

The display manager role may be carried out in different ways:

### 1. Human-led
A human defines and approves display settings.

### 2. AI-assisted
AI proposes display settings, but a human reviews or approves them.

### 3. AI-managed with governance
In the future, AI may create or refine profiles automatically, but only within governed rules.

This means the role is not limited to one person. It may later be shared between humans and AI.

---

## Relationship to Projects and Tenants

A display manager may work at different levels:

### Project level
Defines a profile for one project.

### Tenant level
Defines profiles that multiple projects reuse.

### Platform level
Defines baseline display rules or templates shared across tenants.

---

## Example Responsibilities by Level

### Project
- choose the initial map center
- choose the layer set
- choose popup behavior

### Tenant
- standardize basemap choices
- standardize coordinate behavior
- standardize widget defaults

### Platform
- define profile naming rules
- define minimum schema expectations
- define reusable templates

---

## Governance Role

The display manager should help ensure:

- consistency
- usability
- reuse
- traceability
- approved display behavior

This makes the role important not only for design, but also for governance.

---

## Relationship to Server-10

This role should later connect to:

- ASC
- Jira
- SAM
- tenant setup
- project setup
- manual dashboard
- AI-generated recommendations

This allows display configuration to become a governed part of system execution rather than only a front-end concern.

---

## Minimum Display Manager Outputs

A display manager should be able to produce:

- a valid display profile
- an approved default profile for a project or tenant
- documented display choices
- a reusable configuration others can consume

---

## Final Principle

The display manager is the role that turns display behavior into a managed, reusable, and governable system object.
