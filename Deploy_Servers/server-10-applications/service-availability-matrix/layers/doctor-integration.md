# Doctor Integration

## Purpose

This layer defines how the Service Availability Matrix should eventually inform System Doctor or a future tenant-health check.

It exists so the matrix can influence operational visibility without collapsing tenant business logic into platform runtime doctrine.

This is the doctor-integration layer of the Service Availability Matrix.

## Why This Exists

The platform already uses doctor-style checks for:

- deployment state
- settled state
- dashboard presence
- validation health
- governance health

As server-10 matures, the platform will also need visibility into tenant business readiness, parity, and profile fit.

Without this layer, those concerns remain documentary only.

With this layer, they can become visible in health reporting.

## Core Principle

Doctor integration should begin with visibility, not over-enforcement.

The matrix should first inform health reporting before it starts blocking or heavily controlling behavior.

## What Doctor Should Eventually See

A matrix-aware doctor should eventually be able to report things such as:

- tenant baseline ready or not
- tenant profile identified or unclear
- shared baseline parity aligned or not
- bundle incompleteness visible or not
- registration readiness present or not
- tenant matrix entry missing or present

## Good Early Doctor Signals

Good first signals for matrix-aware health checks may include:

- tenant README missing
- business README missing
- communications README missing
- strategy README missing
- tenant matrix file missing
- profile fit unknown
- registration-readiness below baseline

These are strong enough to matter and simple enough to interpret.

## What Should Not Be Over-Enforced Too Early

The doctor should not immediately become strict about:

- advanced communication maturity
- integration-oriented bundle completeness
- rich hybrid profile expectations
- future-facing optional capabilities

These should remain informative or advisory at first.

## Suggested Doctor Modes

### Informational Passes
Examples:
- tenant baseline present
- tenant matrix entry present
- shared baseline aligned

### Informational Warnings
Examples:
- tenant profile unclear
- bundle only partially visible
- communications maturity still shallow

### Stronger Warnings
Examples:
- baseline missing
- tenant not registration-ready
- expected profile baseline under-met

## Relationship to Parity

Doctor should be profile-aware if matrix integration becomes deeper.

That means:
- a valid profile-specific absence should not be treated like a false platform failure
- a shared baseline absence should be treated more seriously

## Relationship to Governance

Doctor integration should support governance review, not replace it.

The doctor may flag:
- readiness weakness
- parity drift
- under-provisioning
- matrix incompleteness

Governance still decides what larger structural action follows.

## Relationship to Future Automation

Over time, this layer may support:

- profile-aware health reporting
- readiness summaries
- tenant parity warnings
- registration baseline failure signals

But the logic should be understood here before it becomes code.

## Final Principle

The matrix should eventually influence platform health visibility.

This layer exists so tenant business maturity becomes something the platform can observe, not only describe.
