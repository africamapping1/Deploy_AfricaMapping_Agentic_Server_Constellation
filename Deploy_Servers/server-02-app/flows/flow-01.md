# Flow 01 - App Role

## Role

Ingestion, transformation, and application preparation.

## Receives

- approved package
- manifest
- ingestion instruction

## Performs

- ingest package
- transform source data into application-usable form
- prepare data for persistence
- emit application processing events

## Produces

- processed dataset
- ingestion logs
- application status events

## Sends To

- `server-03-db` for persistence
- `server-06-monitoring` for health, status, and anomaly visibility

## Failure Path

If ingestion or transformation fails, processing stops, the event is logged, and monitoring is notified.
