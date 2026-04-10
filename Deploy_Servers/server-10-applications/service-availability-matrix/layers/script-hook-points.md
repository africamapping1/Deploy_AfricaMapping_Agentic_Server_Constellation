# Script Hook Points

## Purpose

This layer defines where future scripts should connect to the Service Availability Matrix.

It exists so automation and operational checks can grow from known insertion points instead of being added randomly.

This is the script-hook layer of the Service Availability Matrix.

## Why This Exists

The matrix is now strong enough that script-level integration is becoming realistic.

But scripts should not appear without clear connection points.

The platform should know where scripts may later:

- read tenant structure
- check baseline presence
- summarize readiness
- warn on drift
- support onboarding
- support doctor visibility

## Core Principle

Hook points should be predictable and low-ambiguity.

Scripts should connect first to stable matrix signals, not to weak interpretive areas.

## Recommended Hook Points

### 1. Baseline Presence Hook

A script may check whether a tenant contains the current required baseline files.

Examples:
- tenant README
- business README
- business-model README
- canvas overview
- communications README
- strategy README

### 2. Communication Minimum Hook

A script may check whether a tenant contains:

- one short-form pitch
- one deeper audience-facing communication

### 3. Matrix Enrollment Hook

A script may check whether a tenant has:

- a tenant matrix file
- expected placement inside the matrix tenant area

### 4. Summary Integrity Hook

A script may later check low-ambiguity summary integrity items such as:

- tenant appears in quick board if expected
- tenant appears in readiness-related summaries if expected

### 5. Onboarding Scaffold Hook

A script may later create or verify:

- baseline file scaffold
- matrix tenant file scaffold
- profile note scaffold

## What Should Not Be Early Hook Points

Avoid early script hooks for:

- hybrid profile final judgment
- promotion approval
- strong exception validation
- standard review decisions
- nuanced governance escalation

These remain better human-guided first.

## Relationship to Automation Readiness

Hook points should only be used where automation readiness is already reasonably strong.

This keeps scripts useful and trusted.

## Final Principle

A future script should plug into stable matrix truth, not unstable interpretation.

This layer exists so automation grows from clear connection points.
