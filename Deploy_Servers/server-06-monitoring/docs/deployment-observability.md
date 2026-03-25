# Deployment Observability

## Purpose

Deployment observability combines GitHub-side transport logs with remote-side heartbeat and status logs.

## Sources of Visibility

### GitHub Actions
- workflow run status
- workflow step logs
- manual and push-triggered deployment history

### Remote Runtime
- `/var/log/africamapping/deploy.log`
- `/opt/africamapping/deployment-state/constellation-status.json`

## Questions Deployment Observability Should Answer

- Is this the first deployment?
- Which servers are present?
- Which servers are missing?
- What was the last deployment result?
- What is the current heartbeat state?
- What was the last known flow?
- Is the constellation steady, degraded, failed, or evolving?

## Principle

The heartbeat is not assumed.
It is observed.
