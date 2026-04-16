# Display Profile Schema

## Purpose

This file defines the shared schema for display profiles used by the display engine.

It exists so display behavior can be described in a structured, reusable, and governable way across projects, tenants, and workflows.

A display profile is the model definition of how a map or display session should behave.

---

## Why This Exists

Without a shared display profile schema, each viewer or project may define display behavior differently.

That leads to:

- inconsistent user experience
- weak reuse
- weak governance
- difficult onboarding
- poor compatibility with ASC, Jira, SAM, and tenant configuration

This schema exists so display configuration becomes a reusable system object.

---

## Core Principle

A display profile should define:

- what is shown
- how it is shown
- how users interact with it
- what defaults should apply
- what rules shape the display session

The display profile is part of the **model** of the display engine.

---

## Display Profile Structure

A display profile should be organized into sections.

### 1. Identity

Defines the identity of the profile.

Fields may include:

- `name`
- `title`
- `description`
- `owner`
- `tenant`
- `version`
- `status`

Example:

```json
{
  "identity": {
    "name": "africamapping-basic",
    "title": "AfricaMapping Basic Viewer",
    "tenant": "africamapping",
    "version": "v1"
  }
}
