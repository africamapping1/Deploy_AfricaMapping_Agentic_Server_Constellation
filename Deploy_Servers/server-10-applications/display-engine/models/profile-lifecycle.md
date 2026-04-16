# Display Profile Lifecycle

## Purpose

This file defines the lifecycle of a display profile.

It exists so display profiles are not only created, but also:

- reviewed
- approved
- applied
- updated
- retired

This allows display configuration to become a governed system object rather than a temporary file.

---

## Why Lifecycle Matters

Without a lifecycle, profiles may:

- drift over time
- conflict across projects
- lack ownership
- lack traceability
- break consistency across users

The lifecycle ensures controlled evolution of display behavior.

---

## Lifecycle Stages

A display profile should move through defined stages.

### 1. Draft

The profile is being created or edited.

Characteristics:

- not yet approved
- may change frequently
- may be incomplete
- used only for testing or development

Example:

```text
africamapping-basic (draft)
