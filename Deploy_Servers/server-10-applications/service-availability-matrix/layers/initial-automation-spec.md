# Initial Automation Spec

## Purpose

This layer defines the first narrow set of checks that the platform could realistically automate from the Service Availability Matrix without creating too much ambiguity or noise.

It exists so automation can begin from a controlled scope.

This is the initial-automation layer of the Service Availability Matrix.

## Why This Exists

The matrix is now rich enough that automation is possible.

But if automation starts too broadly, the platform may create:

- false warnings
- weak profile guesses
- misleading parity conclusions
- brittle checks that outpace governance maturity

This layer defines the smallest safe initial scope.

## Core Principle

The first automation pass should only automate what is:

- clear
- stable
- low-ambiguity
- high-value
- easy to verify from visible structure

## Scope of Initial Automation

### 1. Baseline File Presence

Check whether a tenant has:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README

### 2. Communications Minimum Presence

Check whether a tenant has:

- one short-form pitch
- one deeper audience-facing communication

### 3. Matrix Enrollment Presence

Check whether a tenant has:

- tenant matrix file
- expected visibility in matrix tenant area

### 4. Simple Baseline Outcome

Summarize whether the tenant is:

- baseline failed
- baseline partial
- baseline satisfied

## What Is Deliberately Excluded

The first automation pass should not yet automate:

- final profile assignment
- hybrid profile judgment
- promotion decisions
- standardization decisions
- exception validity
- escalation level
- strong bundle interpretation

These remain human-guided.

## Suggested Output Style

The initial automation pass should ideally output things such as:

- baseline status
- missing required baseline files
- missing communications minimum items
- missing tenant matrix file
- low-noise hints for manual follow-up

## Relationship to Manual Review

This automation should support manual review, not replace it.

The first goal is to reduce repetitive checking work, not to eliminate human judgment.

## Final Principle

The first automation step should be simple enough to trust.

This layer exists so the platform starts small and clean.
