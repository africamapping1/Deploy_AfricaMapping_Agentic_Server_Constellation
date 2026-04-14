# Run Jira Mapping

## Purpose

This file explains how the run system should appear in Jira.

It exists so runs can be represented in a form that both humans and AI can operate through visible work items.

## Main Mapping

### Epic
One product or system direction.

Example:
- AfricaMapping Polygon Data Production System

### Story
One run.

Examples:
- Run-0 – Business Definition
- Run-1 – Imagery Acquisition Business Mapping
- Run-2 – Digitization Methods Business Mapping
- Run-3 – Feature Generation Business Mapping
- Run-4 – Data Storage Business Mapping
- Run-5 – Visualization Business Mapping

### Subtasks
The business-canvas questions inside each run.

Examples:
- Propose value proposition
- Identify customer segments
- Define channels
- Identify resources
- Define cost structure

## Required Jira Context

Each run-story should make clear:

- run ID
- capability name
- capability reference folder
- tenant or product context
- expected output

## Suggested Labels

- `run-system`
- `run-id`
- `capability-name`
- `tenant-name`

## Why This Mapping Works

This mapping makes runs:

- visible
- trackable
- assignable
- reviewable

while preserving business meaning and capability reference.

## Final Principle

Jira should show runs as structured work tied to real capability families, not as vague discussion.
