# Registration Profiles

## Purpose

This directory contains the registration profiles used to guide future tenant onboarding in the application plane.

A registration profile is a governed starting pattern for a new tenant.

It helps the platform avoid creating tenants from scratch every time while still preserving meaningful differences between tenant types.

## Why This Exists

The platform has already learned that:

- a shared tenant baseline exists
- not all tenants need the same service mix
- some tenants are role-surface oriented
- some tenants are stakeholder / service-module oriented
- future tenants may combine both

This means onboarding should move toward profile-aware provisioning.

## What Belongs Here

This directory should contain profile definitions such as:

- role-surface profile
- stakeholder / service-module profile
- hybrid profile
- future profile types as the platform learns

These profiles should define:

- shared baseline
- bundle expectations
- surface expectations
- communication expectations
- readiness assumptions
- parity interpretation

## Relationship to the Matrix

The Service Availability Matrix helps the platform learn what patterns exist.

Registration profiles apply those learned patterns to future onboarding.

The matrix observes.

Profiles provision.

## Relationship to Tenant Types

Profiles are informed by tenant types, but they are more operational.

A tenant type is an interpretation pattern.

A registration profile is the governed onboarding shape derived from that pattern.

## Relationship to Parity

Profiles improve parity because they make expectations clearer.

The right question becomes:

- does this tenant meet the expectations of its profile

rather than:

- does every tenant have the exact same thing

## Current Direction

At this time, the strongest emerging profiles are:

- role-surface
- stakeholder / service-module
- hybrid

These should remain flexible, but they are now strong enough to name and use as design anchors.

## Future Direction

Over time, these profiles may evolve into:

- onboarding defaults
- capability-bundle assignments
- UI-driven tenant registration choices
- provisioning automation
- profile-aware parity checks

## Final Principle

A mature platform should not register tenants as blank folders.

It should register them through explainable profiles.

This directory exists to make those profiles visible and governable.
