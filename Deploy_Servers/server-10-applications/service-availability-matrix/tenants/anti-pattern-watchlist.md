# Tenant Anti-Pattern Watchlist

## Purpose

This file tracks the main anti-pattern risks the platform should watch for as the current tenants evolve.

It exists so the matrix can be used to prevent drift in tenant quality and interpretation.

This is the tenant anti-pattern watchlist.

## Why This Exists

As tenants grow, the main risks are not only missing files.

They are also bad patterns such as:
- drifting below baseline
- misclassifying profile fit
- assuming invalid sameness
- standardizing too early
- ignoring matrix summaries after changes

This file helps keep those risks visible.

## Current Watch Areas

### 1. Baseline Drift in Future Tenant Growth

Risk:
- future tenants may be created without the same baseline strength as current modeled tenants

Why this matters:
- weakens registration baseline trust

## 2. Over-Forcing Role-Surface Logic Onto Stakeholder Tenant Shapes

Risk:
- profile-aware parity may be ignored and wrong expectations may be applied to `africamapping`-like tenants

Why this matters:
- creates false parity problems

## 3. Over-Forcing Stakeholder / Service-Module Logic Onto Role-Surface Tenant Shapes

Risk:
- profile-aware parity may be ignored and wrong expectations may be applied to `realestate-ai`-like tenants

Why this matters:
- creates false parity problems

## 4. Expanding Matrix Files Without Expanding Actual Operational Use

Risk:
- the matrix grows in text but not in review quality or onboarding quality

Why this matters:
- makes the matrix feel heavy without enough practical return

## 5. Failing to Revisit Profile Fit After Tenant Evolution

Risk:
- a tenant may evolve toward hybrid but still be judged under outdated profile assumptions

Why this matters:
- weakens parity and onboarding logic

## Current Interpretation

The current two tenants are still healthy and reasonably aligned.

The anti-pattern risk is mostly future-facing rather than current-crisis.

## Final Principle

A good watchlist helps the platform notice bad patterns before they become normal.

This file exists so matrix quality remains active rather than assumed.
