# Intelligent Server Constellation — User Manual

## 1. What This System Is

This repository defines a governed intelligent server constellation.

It is not a traditional application or infrastructure setup.

It is a system designed to:
- receive change
- evaluate change
- govern change
- execute safely
- observe outcomes
- learn and evolve over time

The system is composed of multiple servers with defined roles, connected through shared state and governed flows.

---

## 2. Why This Exists

Traditional systems are:
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

---

## 3. Core Concepts

### 3.1 Lifecycle

All changes move through:

meet → identify → examine → judge → approve/reject → execute → observe → learn → evolve

This is the governing loop of the constellation.

---

### 3.2 Flows

Flows define how data and actions move between servers.

Example:

server-01-bastion → server-02-app → server-03-db → server-06-monitoring

Flows are defined in:

server-00-foundation/docs/architecture/flows/

Each server implements only its role in the flow.

---

### 3.3 Servers

Each server has a role:

- server-00-foundation → doctrine and rules
- server-01-bastion → intake and trust
- server-02-app → processing
- server-03-db → persistence
- server-05-ci-cd → deployment control
- server-06-monitoring → observation
- server-07 → governance
- server-08 → execution
- server-09 → learning

---

### 3.4 The Invisible Line

The constellation is connected by shared governed state.

This is called the "invisible line".

It is created through:
- shared lifecycle
- shared deployment state
- shared observability
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

Heartbeat is written to:

/opt/africamapping/deployment-state/constellation-status.json

---

## 4. Deployment Model

### 4.1 Philosophy

Deployment is not just copying files.

Deployment:
- lands
- checks environment
- establishes state
- writes heartbeat
- confirms connected life

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
- writes deployment state
- writes heartbeat
- logs events

---

### 4.4 Deployment Logs

Deployment is observable in two places:

GitHub:
- workflow logs
- job history

Remote server:
- /var/log/africamapping/deploy.log
- deployment-state JSON

---

## 5. How to Use This System

### Step 1 — Deploy

Push to GitHub:

git push

This triggers GitHub Actions.

---

### Step 2 — Observe

Check:

GitHub Actions tab  
or

SSH into server:

cat /opt/africamapping/deployment-state/constellation-status.json  
cat /var/log/africamapping/deploy.log

---

### Step 3 — Understand State

Look at:

- heartbeat_state
- server presence
- last deployment result

---

### Step 4 — Extend

To extend the system:

- add new flows
- update server roles
- introduce new servers
- evolve lifecycle rules

---

## 6. System Maturity

This system is in an early architectural phase.

It focuses on:

- structure
- lifecycle
- flow definition
- deployment model
- governance philosophy

Implementation evolves incrementally.

---

## 7. Final Principle

The system is not static.

It is designed to continuously re-evaluate and evolve through governed cycles.

---

## One Line Summary

The constellation is not deployed once.

It continuously becomes.
