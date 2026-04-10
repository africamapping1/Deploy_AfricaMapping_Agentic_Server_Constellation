# Provisioning Hooks

## Purpose

This layer defines where and how the Service Availability Matrix should connect to future tenant provisioning and onboarding flows.

It exists so the matrix can influence real tenant creation instead of remaining separate from provisioning.

This is the provisioning-connection layer of the Service Availability Matrix.

## Why This Exists

The matrix is now strong enough to describe:

- shared tenant baseline
- profile expectations
- bundle expectations
- readiness thresholds
- parity meaning

But if provisioning ignores that knowledge, the platform still depends too heavily on memory and manual setup.

This layer defines where matrix logic should hook into provisioning.

## Core Principle

Provisioning should be informed by learned matrix standards.

A new tenant should be instantiated from:

- baseline rules
- registration profile
- bundle expectations
- readiness logic
- matrix visibility

not from ad hoc manual decisions alone.

## Provisioning Hook Points

### 1. Tenant Creation Hook

When a new tenant is first created, the matrix should influence:

- whether a baseline business structure is provisioned
- whether the tenant gets matrix enrollment immediately
- which profile is assigned initially

### 2. Business Structure Hook

When business directories are created, the matrix should influence whether the tenant receives:

- business README
- business-model README
- canvas overview
- communications README
- strategy README

### 3. Communication Hook

When tenant communications are provisioned, the matrix should influence whether the tenant receives:

- short-form pitch
- one deeper audience-facing communication
- profile-specific communication expectations

### 4. Surface Hook

When service surfaces are provisioned, the matrix should influence whether the tenant receives:

- website expectation
- UI expectation
- dashboard expectation
- role-surface expectation
- stakeholder/service-module expectation

### 5. Matrix Enrollment Hook

When the tenant is created, a matching tenant matrix file should also be created.

This should make the tenant visible in:

- readiness tracking
- parity tracking
- bundle interpretation
- profile fit review

## Provisioning Inputs

A future provisioning flow should ideally accept inputs such as:

- tenant name
- tenant category
- intended registration profile
- baseline bundle selection
- optional bundle selections
- rollout state if applicable
- whether provisioning is pilot, standard, or restricted

## Provisioning Outputs

A future provisioning flow should ideally create at least:

- tenant root README
- tenant business directory
- business baseline files
- baseline communication files
- matrix tenant entry
- profile-aware initial status assignments

## Relationship to Registration Profiles

Provisioning hooks should be profile-aware.

That means:
- a role-surface profile provisions different expectations than a stakeholder/service-module profile
- a hybrid profile may provision more combined structures
- a restricted or pilot profile may provision only partial expectations

## Relationship to Readiness

Provisioning hooks should support readiness rather than guarantee it instantly.

Provisioning may create the structure.

Readiness still depends on whether the structure becomes meaningful, documented, and comparable.

## Relationship to Rollout

Provisioning should also be able to respect rollout state.

Examples:
- a capability may be provisioned only in pilot
- a bundle may be partial during rollout expansion
- a surface may be planned but not yet active

This prevents premature parity pressure.

## Future Automation Direction

Later, provisioning hooks may feed into:

- onboarding scripts
- UI registration workflows
- profile-based scaffolding
- tenant-type bundle assignment
- post-provision readiness review

At the current stage, this layer remains conceptual but operationally important.

## Final Principle

Provisioning should not ignore what the matrix has already taught the platform.

This layer exists so future tenant creation can start from governed patterns instead of repeated reinvention.
