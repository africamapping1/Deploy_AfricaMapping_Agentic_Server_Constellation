# Manual Versus Automated Use

## Purpose

This layer defines which parts of the Service Availability Matrix should currently remain manual, which parts can support semi-automation, and which parts may later become stronger automation targets.

It exists so the platform can grow operationally without automating the wrong things too early.

This is the manual-versus-automated layer of the Service Availability Matrix.

## Why This Exists

The matrix now includes both:

- simple structural checks
- nuanced interpretive judgments

These are not equally suitable for automation.

The platform needs a clear distinction between:
- what humans should keep judging
- what machines can help summarize
- what may later become stronger enforcement logic

## Core Principle

Simple structure can be automated earlier.

Nuanced business interpretation should remain human-guided longer.

## Manual-First Areas

These areas should remain primarily manual at the current stage:

- hybrid profile judgment
- exception validity
- promotion threshold final judgment
- standard review decisions
- architectural escalation decisions
- strong parity interpretation across evolving tenant types

These areas depend heavily on context and should not yet be reduced too quickly.

## Semi-Automation Areas

These areas are good candidates for semi-automation, where the system provides signals or summaries but humans still decide the meaning:

- missing baseline item hints
- missing communication minimum hints
- obvious bundle incompleteness hints
- basic readiness summaries
- profile-supporting pattern hints
- rollout state reminders

These are useful because they reduce review effort without pretending to replace judgment.

## Early Automation Areas

These areas are strong candidates for simple automation earlier:

- baseline file presence
- matrix entry presence
- tenant summary presence
- short-form pitch presence
- deeper audience-facing communication presence
- known folder presence for obvious surfaces

These are strong because they are:
- visible
- consistent
- low-ambiguity
- easy to verify

## Later Automation Areas

These areas may become automation targets only after more maturity:

- profile-aware warnings
- profile-specific readiness gates
- bundle-aware onboarding scaffolds
- stronger parity checks
- doctor-facing readiness signals

These depend on matrix stability and evidence growth.

## What Full Automation Should Avoid for Now

The platform should avoid pretending that the following are fully automatable right now:

- final profile identity
- final standardization decisions
- final promotion approval
- final governance escalation
- nuanced tenant exception approval

These are governance decisions, not just pattern detections.

## Relationship to Review Cycle

The more stable the review cycle becomes, the more automation can safely grow.

That means manual discipline is not a temporary waste.

It is preparation for better automation later.

## Relationship to Enforcement

Only the clearest and strongest automated checks should ever move toward:
- warnings
- gated review
- blocking behavior

This keeps the platform from becoming brittle.

## Final Principle

A mature platform automates what is clear and keeps humans where judgment still matters.

This layer exists so matrix operationalization grows with discipline rather than impatience.
