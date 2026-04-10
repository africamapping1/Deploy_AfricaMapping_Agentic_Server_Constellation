# Provisioning Readiness

## Purpose

This layer defines when the Service Availability Matrix is mature enough to influence tenant provisioning in a practical way.

It exists so the platform can distinguish between:

- matrix logic that is still only descriptive
- matrix logic that is stable enough to shape scaffolding
- matrix logic that is strong enough to guide provisioning defaults

This is the provisioning-readiness layer of the Service Availability Matrix.

## Why This Exists

The matrix now knows many things about tenants, including:

- baseline structure
- communications minimums
- readiness thresholds
- profile patterns
- bundle patterns
- parity meaning

But not every one of those ideas should immediately affect provisioning.

This layer defines what must be true before provisioning starts depending on the matrix in a stronger way.

## Core Principle

Provisioning should follow stable matrix knowledge, not experimental matrix ideas.

The platform should provision from what is already strong enough to trust.

## Readiness Questions

When deciding whether a matrix rule is ready to influence provisioning, the platform should ask:

- is the rule already repeated across tenants
- is the rule easy to check
- is the rule low-ambiguity
- does the rule improve onboarding quality
- would using the rule prevent common omissions
- is the rule stable enough that changing it soon is unlikely

## Suggested Provisioning Readiness States

### Not Provisioning-Ready

Use when the pattern is still too interpretive or too weak.

Examples:
- hybrid profile assumptions
- advanced communication maturity
- integration-oriented bundle standardization

### Provisioning Hint Ready

Use when the pattern is stable enough to guide humans during provisioning, but not yet strong enough for strong default automation.

Examples:
- likely role-surface expectations
- likely stakeholder/service-module expectations

### Provisioning Scaffold Ready

Use when the pattern is strong enough to justify creating a default file or folder scaffold during onboarding.

Examples:
- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README

### Provisioning Default Ready

Use when the pattern is stable enough to be treated as an expected starting provision during onboarding.

Examples:
- business minimum baseline
- short-form pitch baseline
- matrix enrollment baseline

## Good Early Provisioning Candidates

The strongest early provisioning-ready elements are likely:

- tenant root README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- short-form pitch
- one deeper audience-facing communication
- tenant matrix file

These are strong because they are:
- repeated
- visible
- low-ambiguity
- useful immediately

## What Should Wait Longer

The following should likely remain weaker provisioning candidates for now:

- positioning as universal default
- objection handling as universal default
- full operator explanation as universal default
- hybrid-specific combined surface set
- integration-heavy bundle defaults

These need more evidence first.

## Relationship to Registration Profiles

Provisioning readiness should work together with profile logic.

A baseline may be provisioning-default ready for all tenants.

A bundle may only be provisioning-hint ready for one tenant type.

This distinction is important.

## Relationship to Automation

Provisioning readiness is one of the strongest bridges between the matrix and operational control.

When readiness becomes strong enough, the matrix can begin influencing:
- scaffolding
- default file creation
- profile-based onboarding shape
- initial tenant matrix generation

## Final Principle

The platform should provision from what it already knows well.

This layer exists so matrix knowledge enters provisioning in a disciplined and trustworthy way.
