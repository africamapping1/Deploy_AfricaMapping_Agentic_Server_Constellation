# ASC to Server-07 Handoff Contract

## Purpose

This file defines how ASC hands execution-ready work from `server-10-applications` into `server-07-ai-orchestrator`.

It exists so the system can move from definition and intake into governed action without ambiguity.

## Why This Exists

`server-10-applications` now defines:

- business meaning
- GIS capability families
- run outputs
- run synthesis
- ASC intake
- Jira execution mapping

But `server-10` should not execute work directly.

Execution must be handed into the governed orchestration layer.

This file defines that bridge.

## Source Inputs from ASC

Server-07 should be able to consume at least the following ASC-side artifacts:

### 1. ASC Intake
Example:
- `asc/intake/<tenant>/intake.md`

This defines:
- program
- projects
- activities
- execution model
- Jira mapping intent

### 2. Jira Mapping
Example:
- `asc/jira/<tenant>-jira.md`

This defines:
- Epic
- Stories
- Tasks
- assignment model
- feedback loop expectation

### 3. Run Synthesis
Example:
- `service-availability-matrix/runs/<tenant>/run-synthesis.md`

This defines:
- system flow
- capability roles
- readiness direction
- suggested initial activities

## Minimum Handoff Fields

A valid handoff to server-07 should make clear:

- tenant name
- program name
- project names
- activity list
- source synthesis reference
- execution intent
- expected outputs
- whether work is human, AI, or hybrid assignable

## What Server-07 Should Do

After receiving a valid handoff, server-07 should be able to:

### 1. Interpret
Read the handoff and determine what class of governed work is being requested.

### 2. Prioritize
Decide what should run first based on:
- readiness
- dependencies
- policy
- active system state

### 3. Route
Route work into the proper execution path, such as:
- server-01 receive flow
- server-02 application processing
- server-08 AI worker execution
- future human review path

### 4. Record
Write a decision or routing outcome so the system knows what happened.

### 5. Return Status
Expose status back into observable outputs so ASC, Jira, and monitoring can see progress.

## Suggested Handoff Outcome Types

Server-07 should be able to produce outcomes such as:

- accepted
- accepted with sequencing
- accepted with human review required
- deferred
- rejected

## Relationship to Other Servers

### Server-01 Bastion
Receives admitted work into the active constellation.

### Server-02 App
Processes execution logic for admitted work.

### Server-03 DB
Stores durable state for program, project, and activity execution.

### Server-06 Monitoring
Observes whether the handoff led to real state changes.

### Server-08 AI Worker
Executes AI-routed tasks when assigned.

## What This Contract Does Not Do

This file does not define:
- detailed task execution internals
- final worker prompts
- final database schema
- final monitoring dashboards

It only defines the handoff boundary between ASC and server-07.

## Example Flow

```text
server-10-applications
→ asc/intake/africamapping/intake.md
→ asc/jira/africamapping-jira.md
→ server-07-ai-orchestrator
→ decision / routing / sequencing
→ downstream execution
