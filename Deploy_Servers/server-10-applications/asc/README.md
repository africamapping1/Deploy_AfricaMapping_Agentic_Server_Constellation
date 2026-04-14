# ASC — Application Service Controller

## Purpose

ASC is the execution authority of the system.

It converts defined systems into executable work.

---

## Inputs

ASC consumes:

- run-synthesis outputs
- business framework definitions
- GIS framework capabilities

---

## Responsibilities

ASC is responsible for:

- generating programs
- generating projects
- generating activities
- assigning work to humans and AI agents
- mapping execution into Jira

---

## Structure

- intake/ → incoming executable definitions
- jira/ → execution mapping layer

---

## Authority Rule

ASC is the ONLY location where execution definitions live.

No execution definitions should exist inside:

- runs/
- business-framework/
- gis-framework/

Those are definition layers only.

---

## Flow

```text
Run System → Run Synthesis → ASC Intake → Jira → Execution
