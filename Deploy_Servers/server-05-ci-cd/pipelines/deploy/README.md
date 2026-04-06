# Constellation Deploy Pipeline

## Purpose

This pipeline deploys the ASC platform payload to remote infrastructure and writes deployment state that represents the heartbeat of the constellation.

> Note: ASC is the platform identity. AfricaMapping, RealEstate AI, and future businesses are tenants running on the platform.
> Current runtime paths such as `/opt/africamapping` and `/var/log/africamapping` are legacy operational roots still in use and may be migrated later.

## Responsibilities

- detect first-time deployment
- detect which constellation servers are present
- write shared deployment state
- write remote deployment logs
- expose deployment status back to GitHub Actions
- finalize platform heartbeat and deployment truth at the end of a governed run

## Deployment Truth

The deployment truth exists in two places:

### Transport-side truth
- GitHub Actions workflow runs
- GitHub Actions step logs
- workflow success and failure history

### Remote-side truth
- `/var/log/africamapping/deploy.log`
- `/opt/africamapping/deployment-state/constellation-status.json`

## Platform Boundary

This pipeline deploys and measures the ASC platform.

It does not define tenant business logic.

Tenant applications and business systems run on top of the platform and are governed through platform flows, policies, and state boundaries.

## Principle

Deployment does not merely move files.

Deployment awakens, measures, and settles governed platform state.
