# First Automation Checklist

## Purpose

This layer defines the exact small set of checks that should be used for the first practical automation pass of the Service Availability Matrix.

It exists so the first automation step stays disciplined and low-risk.

This is the first-automation-checklist layer of the Service Availability Matrix.

## Why This Exists

The matrix is already broad.

The first automation pass should stay narrow enough to be:

- trustworthy
- easy to verify
- easy to interpret
- useful immediately

This file turns the automation roadmap into a concrete starting checklist.

## Core Principle

The first automation pass should only check what is strongly visible and low-ambiguity.

## First Automation Checks

### 1. Tenant Root README Check
Confirm whether:
- `apps/<tenant>/README.md` exists

### 2. Business README Check
Confirm whether:
- `apps/<tenant>/business/README.md` exists

### 3. Business Model README Check
Confirm whether:
- `apps/<tenant>/business/business-model/README.md` exists

### 4. Canvas Overview Check
Confirm whether:
- `apps/<tenant>/business/canvas/overview.md` exists

### 5. Communications README Check
Confirm whether:
- `apps/<tenant>/business/communications/README.md` exists

### 6. Strategy README Check
Confirm whether:
- `apps/<tenant>/business/strategy/README.md` exists

### 7. Short-Form Pitch Check
Confirm whether one short-form pitch exists, such as:
- `elevator-pitch.md`

### 8. Deeper Audience-Facing Communication Check
Confirm whether at least one deeper audience-facing communication exists, such as:
- investor pitch
- stakeholder pitch
- partner explanation
- customer explanation

### 9. Tenant Matrix Entry Check
Confirm whether:
- `service-availability-matrix/tenants/<tenant>.md` exists

## Suggested First Outputs

The first automation pass should summarize:

- baseline satisfied / partial / failed
- missing baseline items
- missing communication minimum items
- missing tenant matrix entry

## What This Checklist Should Not Do Yet

The first automation pass should not yet:

- assign a final profile
- judge hybrid status
- judge promotion readiness
- approve exceptions
- decide governance escalation

These remain manual.

## Final Principle

The first automation pass should reduce repetitive checking without pretending to replace judgment.

This layer exists so that first automation step stays clean and useful.
