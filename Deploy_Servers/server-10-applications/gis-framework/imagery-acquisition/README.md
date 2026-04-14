# Imagery Acquisition

## Purpose

This folder defines the reusable imagery-acquisition capability of the GIS framework.

It exists so the platform can treat imagery acquisition as a real capability family rather than as an ad hoc step inside one project.

Imagery acquisition is the upstream entry point for many GIS products, including feature generation systems such as land cover, water bodies, and buildings.

## Main Idea

Imagery acquisition covers how the system:

- finds imagery sources
- evaluates imagery options
- decides what imagery is fit for purpose
- brings imagery into the wider GIS workflow
- prepares imagery for later use by other capability areas

This capability should be reusable across tenants and projects.

## Why This Exists

Without a reusable imagery-acquisition capability, projects may repeatedly make unclear or inconsistent decisions about:

- what imagery to use
- why that imagery was chosen
- whether quality is sufficient
- whether cost is acceptable
- whether access and storage are sustainable

This folder exists so those decisions can become more structured and repeatable.

## Core Questions

Imagery acquisition should eventually help answer questions such as:

- what imagery source fits the target product
- what spatial and temporal resolution is needed
- what coverage is needed
- what quality is acceptable
- what access or licensing conditions apply
- what retrieval and storage path should be used

## Relationship to the Business Framework

Imagery acquisition should later be run through the business canvas so the platform can clarify things such as:

- what value imagery provides
- who depends on imagery quality
- what channels imagery supports
- what resources imagery requires
- what partners or providers matter
- what cost implications exist

## Relationship to the Run System

In the run system, imagery acquisition is the normal first GIS capability run after Run-0.

That means the platform can begin with:

- Run-0 → pure business definitions
- Run-1 → imagery acquisition × business canvas

This helps the platform clarify the first upstream capability before later downstream work begins.

## Relationship to Other GIS Capabilities

Imagery acquisition feeds later capabilities such as:

- digitization methods
- feature generation
- data storage
- visualization

That makes it a foundational upstream capability.

## Future Contents

This folder may later include materials such as:

- imagery source options
- quality criteria
- selection rules
- retrieval methods
- storage intake notes
- cost and access comparisons

## Final Principle

Imagery acquisition should be treated as a reusable system capability, not only as a one-time project task.
