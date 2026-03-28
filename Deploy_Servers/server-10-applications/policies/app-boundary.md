# Application Boundary Policy

Applications may consume infrastructure services, but must not alter infrastructure doctrine, runtime state, or governance internals directly.

## Allowed

- send events
- receive outputs
- use defined interfaces
- operate as modular business-facing units

## Forbidden

- editing deployment-state
- altering Governance Loop logic
- modifying infrastructure doctrine
- bypassing reason and policy checks
