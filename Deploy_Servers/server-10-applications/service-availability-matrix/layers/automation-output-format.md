# Automation Output Format

## Purpose

This layer defines how early automation outputs from the Service Availability Matrix should be structured.

It exists so automated findings are readable, comparable, and easy to review.

This is the automation-output-format layer of the Service Availability Matrix.

## Why This Exists

Even a good automated check can become noisy if its output is unclear.

The platform should ensure that automated matrix output is:

- concise
- structured
- low-noise
- easy to compare across tenants
- easy to act on manually

## Core Principle

Automation output should support review, not overwhelm it.

## Recommended Output Sections

### 1. Tenant Name
Clearly state which tenant is being checked.

### 2. Baseline Status
Return one of:
- baseline satisfied
- baseline partial
- baseline failed

### 3. Missing Items
List any missing baseline or communication minimum items.

### 4. Matrix Visibility Status
State whether the tenant matrix file is present.

### 5. Advisory Notes
Include only low-noise useful notes.

Examples:
- deeper audience-facing communication missing
- matrix file missing
- baseline incomplete

### 6. Severity Hint
Where useful, provide a simple severity hint such as:
- informational
- advisory
- warning
- significant

## Recommended Style

Outputs should be:

- simple
- predictable
- one tenant at a time or table-based
- easy to compare across runs

## Example Minimal Output

```text
tenant=realestate-ai
baseline_status=satisfied
missing_items=
matrix_entry=present
severity=informational
notes=none
