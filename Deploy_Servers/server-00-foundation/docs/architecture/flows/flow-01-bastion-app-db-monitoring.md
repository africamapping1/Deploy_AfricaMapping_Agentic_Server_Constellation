# Flow 01 - Bastion → App → DB → Monitoring

## Purpose

This flow defines the first real operational slice of the constellation.

It models how a new approved external data package enters the system, is verified, processed by the application layer, persisted to the database layer, and observed by the monitoring layer.

This is the first heartbeat of the constellation.

## Trigger

A new external data package arrives for AfricaMapping.

Examples:
- a mapping dataset
- a partner data feed
- a curated external package
- an approved research-derived input

## Lifecycle Route

meet → identify → examine → judge → approve/reject → execute → observe → learn → evolve

## Flow Summary

1. `server-01-bastion` receives and verifies the incoming package.
2. If approved, it passes the package and manifest to `server-02-app`.
3. `server-02-app` ingests and transforms the package into application-usable form.
4. `server-03-db` validates and persists the resulting structured data.
5. `server-06-monitoring` records events, health, anomalies, and audit evidence across the flow.

## Server Responsibilities

### server-01-bastion
Role:
- intake
- identity
- verification
- staging
- approval or rejection gate

Receives:
- external package
- metadata
- source identity
- trust context

Performs:
- identify source
- verify trust
- security screening
- compatibility checks
- stage for approval or quarantine

Produces:
- approved manifest
- rejection reason
- quarantine record
- audit event

Sends to:
- `server-02-app` if approved
- `server-06-monitoring` if rejected, quarantined, or suspicious

### server-02-app
Role:
- ingestion
- transformation
- application preparation

Receives:
- approved package
- manifest
- ingestion instruction

Performs:
- ingest package
- transform data into application-usable structure
- prepare state for persistence
- emit application events

Produces:
- processed dataset
- ingestion logs
- application status event

Sends to:
- `server-03-db`
- `server-06-monitoring`

### server-03-db
Role:
- schema validation
- persistence
- durable state

Receives:
- processed dataset
- schema mapping
- write instruction

Performs:
- validate against schema
- write to appropriate tables / structures
- preserve transaction outcome

Produces:
- persisted state
- write success/failure record
- queryable dataset state

Sends to:
- `server-06-monitoring`
- `server-02-app` as queryable state when needed

### server-06-monitoring
Role:
- observation
- evidence
- alerting
- audit trail

Receives:
- verification events from bastion
- ingestion logs from app
- write events from db
- error and status signals

Performs:
- classify events
- record metrics
- detect anomalies
- create alert or dashboard evidence
- preserve audit trail

Produces:
- health signal
- incident record
- audit evidence
- operational dashboard data

Sends to:
- human operators
- future governance flows
- historical evidence stores

## Failure Paths

### At bastion
- failed trust validation
- failed security screening
- failed compatibility check

Action:
- quarantine package
- emit monitoring alert
- block downstream movement

### At app
- failed ingestion
- failed transform
- invalid manifest

Action:
- stop processing
- log incident
- notify monitoring

### At db
- failed schema validation
- failed write
- failed migration compatibility

Action:
- reject persistence
- emit failure event
- preserve rollback / retry evidence

## Audit Trail

This flow should always leave evidence for:
- source identity
- verification result
- approval or rejection reason
- ingestion start and completion
- database write result
- monitoring classification
- incident or anomaly handling

## Success Criteria

A flow run is successful when:
- the incoming package is verified
- approved data is transformed correctly
- the resulting data is persisted
- the full event chain is observable
- the audit trail is preserved end-to-end

## Architectural Meaning

This flow proves that the constellation is not merely stored as folders.

It receives, verifies, processes, persists, and observes a real routed event across multiple servers.

This is the first operational proof that the constellation can live as a connected system.
