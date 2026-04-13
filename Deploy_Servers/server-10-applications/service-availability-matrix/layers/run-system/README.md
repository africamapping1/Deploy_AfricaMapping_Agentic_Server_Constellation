# Run System

## Purpose

This folder defines the reusable run system used to move a capability through structured business interpretation before execution begins.

It exists so the platform does not jump directly from idea to execution without first clarifying value, stakeholders, channels, resources, activities, and expected outputs.

The run system is part of the Service Availability Matrix because it helps govern the transition from definition to execution.

## Main Idea

A run is a structured pass of one capability through the business canvas.

This means the platform takes one capability, such as:

- imagery acquisition
- digitization methods
- polygon generation
- data storage
- visualization

and asks the business questions around it before treating it as execution-ready.

## Why This Exists

Without a run system, execution can begin while:

- value is still unclear
- customers are still undefined
- channels are still uncertain
- resources are not yet understood
- success criteria are not yet stable

That creates waste and confusion.

The run system exists to reduce that.

## Relationship to the Wider System

- business-framework defines reusable business meaning
- gis-framework defines reusable GIS capability areas
- run-system connects one GIS capability to the business framework
- Jira can represent runs as Stories
- ASC can later consume completed runs for execution planning

## Main Files

- `run-0-definition.md`
- `run-template.md`
- `run-sequence.md`
- `run-jira-mapping.md`
- `run-output-format.md`
- `run-learning-integration.md`
- `run-stop-point.md`

## Final Principle

A run should clarify the business meaning of a capability before the system is asked to execute it.
