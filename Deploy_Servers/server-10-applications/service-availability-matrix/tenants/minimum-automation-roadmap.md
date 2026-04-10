# Minimum Automation Roadmap

## Purpose

This file defines the smallest practical roadmap for beginning automation around the Service Availability Matrix.

It exists so the platform can begin operational automation in a low-risk, staged way.

This is the minimum-automation layer of the tenant matrix.

## Why This Exists

The matrix is already strong enough that some automation can begin.

But the platform should start with the simplest and strongest checks first.

This file defines that smallest sensible path.

## Core Principle

Automate the clear signals first.

Do not wait for perfect automation everywhere before starting.

## Phase 1 — Presence Checks

First automation should check simple file presence for baseline items such as:

- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README
- short-form pitch
- deeper audience-facing communication
- tenant matrix file

## Why Phase 1 First

These are:
- low ambiguity
- repeated across tenants
- directly useful
- easy to verify

## Phase 2 — Baseline Outcome Summary

After file presence checks, automation can summarize:

- baseline satisfied
- baseline partial
- baseline failed

This gives fast readiness visibility.

## Phase 3 — Surface Presence Hints

Next automation may check obvious surface signals such as:

- website subtree exists
- UI subtree exists
- known role-surface folders exist
- known stakeholder/service-module areas exist

These should remain hints first, not strong judgments.

## Phase 4 — Matrix Entry Integrity Checks

Later automation may check:

- tenant appears in tenant matrix file
- tenant appears in key summary layers if expected
- file naming consistency is preserved

This improves matrix hygiene.

## Phase 5 — Advisory Warnings

Only after earlier phases are stable should the platform begin advisory outputs such as:

- tenant missing deeper audience-facing communication
- tenant missing matrix entry
- tenant missing baseline file
- obvious profile-supporting structure absent

These should still remain advisory at first.

## What Not to Automate Early

The platform should delay heavy automation of:

- final profile assignment
- hybrid judgment
- promotion decisions
- standard-review decisions
- exception validity
- governance escalation

These remain better suited to human judgment for now.

## Final Principle

The best first automation is small, clear, and useful.

This file exists so the matrix starts becoming operational without becoming brittle.
