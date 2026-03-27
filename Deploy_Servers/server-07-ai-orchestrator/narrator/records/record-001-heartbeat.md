# Heartbeat Reason Record

## Intent
Introduce heartbeat as the measurable living state of the constellation.

## Classification
platform-change

## Scope
- server-00-foundation
- server-05-ci-cd
- server-06-monitoring
- deployment-state
- narrator summaries

## Expected Outcome
- deployment writes a state file
- the constellation records whether it is initialized
- the system can report whether it is steady, degraded, failed, or evolving
- narrator can interpret current system condition

## Why This Exists
To prevent deployment from being stateless and to give the constellation a way to know and express its condition.

## System Impact
- enables deployment memory
- supports monitoring interpretation
- supports narrator summaries
- creates a foundation for governed evolution

## Risk Level
low

## Observability
- /opt/africamapping/deployment-state/constellation-status.json
- /var/log/africamapping/deploy.log
- narrator summaries

## Status
implemented

## Narrator Note
Heartbeat turned deployment into living state.
