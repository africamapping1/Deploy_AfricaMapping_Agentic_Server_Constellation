# Constellation Deploy Pipeline

## Purpose

This pipeline deploys the constellation payload from GitHub Actions to remote infrastructure and writes deployment state that represents the heartbeat of the constellation.

## Responsibilities

- detect first-time deployment
- detect which constellation servers are present
- write shared deployment state
- write remote deployment logs
- expose deployment status back to GitHub Actions

## Deployment Truth

The deployment truth exists in two places:

### Transport-side truth
- GitHub Actions workflow runs
- GitHub Actions step logs
- workflow success and failure history

### Remote-side truth
- `/var/log/africamapping/deploy.log`
- `/opt/africamapping/deployment-state/constellation-status.json`

## Principle

Deployment does not merely move files.

Deployment awakens and measures connected life.
