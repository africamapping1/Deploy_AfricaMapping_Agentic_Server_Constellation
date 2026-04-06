# ASC Intelligent Server Constellation — User Manual

## 1. What This System Is

This repository defines a governed intelligent server constellation for the ASC platform.

It is not a traditional application or a simple infrastructure setup.

It is a system designed to:

- receive change
- evaluate change
- govern change
- execute safely
- observe outcomes
- learn and evolve over time

The system is composed of multiple servers with defined roles, connected through shared state and governed flows.

> Note: ASC is the platform identity. AfricaMapping, RealEstate AI, and future businesses are tenants running on the platform.
> Current runtime paths such as `/opt/africamapping` and `/var/log/africamapping` are legacy operational roots still in use and may be migrated later.

---

## 2. Why This Exists

Traditional systems are often:

- static
- manually maintained
- reactive

This system is designed to be:

- structured but evolving
- governed but adaptive
- observable and accountable

It introduces:

- lifecycle-driven behavior
- flow-based architecture
- deployment as system awakening
- heartbeat as proof of life
- governed interpretation through orchestrated platform roles

---

## 3. Core Concepts

### 3.1 Lifecycle

All changes move through a governed path:

meet → identify → examine → judge → approve/reject → execute → observe → learn → evolve

This is the governing loop of the constellation.

---

### 3.2 Flows

Flows define how data and actions move between servers.

Example:

server-01-bastion → server-02-app → server-03-db → server-06-monitoring

Flows define how the platform routes, processes, stores, and observes work.

Each server implements only its role in the flow.

---

### 3.3 Servers

Each server has a role:

- server-00-foundation → doctrine, policy, and standards
- server-01-bastion → intake, trust, and entry control
- server-02-app → processing and runtime logic
- server-03-db → persistence
- server-05-ci-cd → deployment control
- server-06-monitoring → observation and health reporting
- server-07-ai-orchestrator → governance, narration, strategy, and platform intelligence
- server-08-ai-worker → execution work
- server-09-ai-training → learning and model evolution
- server-10-applications → tenant application ownership layer

---

### 3.4 The Invisible Line

The constellation is connected by shared governed state.

This is called the "invisible line".

It is created through:

- shared lifecycle
- shared deployment state
- shared observability
- shared governance
- participation in flows

---

### 3.5 Heartbeat

The heartbeat is the measurable state of the constellation.

It answers:

- Is the system initialized?
- Which servers are present?
- Is the system steady, degraded, or failed?
- What was the last deployment?
- What was the last flow?

Heartbeat is currently written to:

`/opt/africamapping/deployment-state/constellation-status.json`

This is a current runtime location, even though the root path still uses legacy AfricaMapping naming.

---

## 4. Deployment Model

### 4.1 Philosophy

Deployment is not just copying files.

Deployment:

- lands
- checks environment
- establishes state
- writes heartbeat
- executes governed flows
- confirms connected life
- settles final platform state

---

### 4.2 Landing Doctrine

All deploy needs is an SSH key.

The system assumes:

- only SSH access is required to land
- everything else is validated or created during deployment

---

### 4.3 Deployment Flow

GitHub Actions:

- connects via SSH
- uploads deployment scripts
- runs bootstrap check

Bootstrap:

- verifies sudo
- prepares directories
- validates landing

Deployment:

- uploads constellation payload
- writes initial deployment state
- runs governed flows
- generates narrated and strategist outputs
- writes final deployment state
- logs events

---

### 4.4 Deployment Logs

Deployment is observable in two places:

GitHub:

- workflow logs
- job history

Remote server:

- `/var/log/africamapping/deploy.log`
- deployment-state JSON

These paths remain current runtime roots, though the platform identity is ASC.

---

## 5. How to Use This System

### Step 1 — Deploy

Push to GitHub:

```bash
git push
