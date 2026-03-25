# Flow 01 - DB Role

## Role

Schema validation, persistence, and durable state management.

## Receives

- processed dataset
- schema mapping
- write instruction

## Performs

- validate against schema
- write structured records
- preserve transaction outcome
- maintain durable queryable state

## Produces

- persisted state
- write success or failure record
- database transaction evidence

## Sends To

- `server-06-monitoring` for event and health visibility
- `server-02-app` as queryable state when needed

## Failure Path

If schema validation or write operations fail, persistence is blocked, the failure is recorded, and monitoring receives the event.
