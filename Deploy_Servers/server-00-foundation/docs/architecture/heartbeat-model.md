# Heartbeat Model

## Core Idea

The constellation is alive when its connected servers can participate in governed flows and express shared state.

Heartbeat is the measurable condition of that living participation.

## Heartbeat Meaning

Heartbeat answers questions such as:

- Has the constellation ever been deployed before?
- Which servers are present?
- Which servers are missing?
- What was the last deployment result?
- What flow most recently moved through the constellation?
- Is the constellation initializing, steady, degraded, failed, or evolving?

## Heartbeat States

- `initializing` — first deployment or first known emergence
- `steady` — expected servers are present and deployment completed successfully
- `degraded` — some servers are missing, stale, or unhealthy
- `failed` — deployment failed or required participation is broken
- `evolving` — deployment succeeded and structural or behavioral change was introduced

## First Heartbeat

The first deployment writes the first heartbeat.

This is the first recorded proof that the constellation exists as connected life rather than stored structure.

## Heartbeat as State

Heartbeat should be written as shared state on the remote side.

Example fields include:

- constellation name
- initialized
- first_deploy
- heartbeat_state
- last_deploy_at
- last_deploy_result
- last_flow
- per-server status

## Principle

Connection is philosophy.
Heartbeat is state.
