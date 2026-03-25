# Flow 01 - Bastion Role

## Role

Intake, identity, verification, staging, and approval gate.

## Receives

- external data package
- metadata
- source identity
- trust context

## Performs

- identify source
- verify trust
- security screening
- compatibility checks
- stage package for approval, quarantine, or rejection

## Decides

- approve → send forward
- reject → block and record
- quarantine → isolate and alert

## Produces

- approved manifest
- rejection reason
- quarantine record
- audit event

## Sends To

- `server-02-app` if approved
- `server-06-monitoring` for alerts, evidence, and rejection visibility

## Failure Path

If verification fails, the package does not proceed.
It is quarantined or rejected and the event is logged for monitoring and audit.
