# Provisioning Actions

## Purpose

This layer defines the actions the platform should eventually take during tenant provisioning based on what the Service Availability Matrix already knows.

It exists so provisioning can move from passive folder creation toward governed business-aware setup.

This is the provisioning-action layer of the Service Availability Matrix.

## Why This Exists

The matrix already describes:

- tenant baseline
- registration profiles
- bundle expectations
- readiness thresholds
- parity logic

But provisioning still needs a practical action vocabulary.

The platform should be able to say:

- what should be created automatically
- what should be scaffolded
- what should be flagged for later completion
- what should wait for profile review
- what should not be provisioned yet

## Core Principle

Provisioning should take different actions depending on the maturity and certainty of the matrix rule.

Not every matrix insight should become the same provisioning behavior.

## Action Categories

### 1. Auto-Create

Use when the matrix rule is stable enough to justify automatic provisioning.

Examples:
- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- tenant matrix file

### 2. Auto-Scaffold

Use when the platform should create the structure, but tenant-specific completion still requires later work.

Examples:
- short-form pitch template
- deeper audience-facing communication placeholder
- profile-aware optional surface folders
- future business-model detail placeholders

### 3. Mark Pending

Use when the platform should explicitly record that something is expected later, but not yet fully provisioned.

Examples:
- operator explanation
- objection handling
- advanced communication files
- profile-specific optional surfaces

### 4. Request Profile Review

Use when provisioning depends too heavily on tenant profile clarity.

Examples:
- customer/employee surface set
- stakeholder/service-module bundle
- hybrid bundle mix
- advanced onboarding bundle choices

### 5. Hold Back

Use when the matrix logic is not yet mature enough to justify provisioning.

Examples:
- weak bundle ideas
- unstable integration-oriented patterns
- future-facing hybrid assumptions without enough evidence

## Good Early Auto-Create Candidates

The strongest current candidates for automatic creation are:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- tenant matrix file

These are repeated, visible, and low-ambiguity.

## Good Early Auto-Scaffold Candidates

The strongest current candidates for automatic scaffolding are:

- elevator pitch
- one deeper audience-facing communication file
- profile note
- readiness placeholder

These are useful but still require tenant-specific content.

## Relationship to Registration Profiles

Provisioning actions should be profile-aware.

That means:
- universal baseline items may be auto-created
- profile-specific items may be scaffolded or marked pending
- uncertain profile-dependent items may require review first

## Relationship to Readiness Gates

Provisioning actions should help tenants progress through readiness gates in sequence.

Provisioning should create the path.

Readiness review should confirm whether the tenant has actually crossed the threshold.

## Final Principle

Provisioning should not create everything blindly.

This layer exists so the matrix can guide what gets created, scaffolded, deferred, reviewed, or held back.
