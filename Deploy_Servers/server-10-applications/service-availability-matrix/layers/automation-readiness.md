# Automation Readiness

## Purpose

This layer defines when parts of the Service Availability Matrix are mature enough to support automation.

It exists so the platform can distinguish between:

- logic that is still mainly documentary
- logic that is stable enough for review tooling
- logic that is strong enough for semi-automation
- logic that may eventually support enforcement

This is the automation-readiness layer of the Service Availability Matrix.

## Why This Exists

Not every matrix concept should be automated immediately.

Some parts are already clear and stable.

Others are still interpretive and should remain human-guided.

Without this layer, the platform risks:

- automating weak logic too early
- treating nuanced business interpretation like rigid code
- creating noisy or misleading checks

This layer exists so automation grows in the right order.

## Core Principle

Automation should follow clarity.

The matrix should automate only what is already stable enough to be interpreted consistently.

## Automation Readiness Levels

### 1. Manual Only

Use when the logic is still highly interpretive.

Examples:
- rich bundle interpretation
- hybrid profile fit
- early promotion judgment
- nuanced exception reasoning

### 2. Review-Support Ready

Use when the logic can help humans review more consistently, but still needs human judgment.

Examples:
- baseline presence checks
- tenant matrix entry presence
- known file existence checks
- simple readiness indicators

### 3. Semi-Automation Ready

Use when the logic is stable enough to produce useful machine-generated summaries, warnings, or comparison hints.

Examples:
- missing baseline item flags
- missing communications baseline flags
- matrix enrollment checks
- obvious profile-supporting surface checks

### 4. Automation Candidate

Use when the logic is strong enough to influence repeatable system behavior with low ambiguity.

Examples:
- tenant baseline completeness
- registration baseline presence
- required matrix file presence
- shared baseline drift signals

### 5. Enforcement Candidate

Use when the logic is both stable and important enough to be considered for stronger warning, gating, or blocking behavior.

Examples:
- missing tenant business minimum baseline
- missing matrix visibility for a tenant expected to be governed
- clearly broken registration baseline

## Good Early Automation Targets

The strongest early automation targets are likely:

- tenant README presence
- business README presence
- business-model README presence
- canvas overview presence
- communications README presence
- strategy README presence
- short-form pitch presence
- deeper audience-facing communication presence
- tenant matrix file presence

These are file-based, high-signal, and low-ambiguity.

## What Should Stay Manual for Longer

The following areas should remain more human-guided for now:

- deeper profile fit nuance
- promotion thresholds
- tenant-type interpretation
- exception validity
- bundle maturity nuance
- hybrid profile judgment

These are important, but still more interpretive than mechanical.

## Relationship to Doctor Integration

Automation readiness should inform doctor integration.

Only the strongest and clearest matrix signals should reach doctor checks first.

That keeps doctor useful and low-noise.

## Relationship to Provisioning

As automation readiness increases, some matrix expectations may begin influencing provisioning scaffolds and onboarding defaults.

But provisioning should only use matrix logic that has become stable enough to trust.

## Final Principle

The matrix should automate what is clear first.

This layer exists so operational automation grows from strong signal, not from impatience.
