# Server-10 Applications

## Purpose

`server-10-applications` is the application and business definition plane of ASC.

It is where applications, tenant business structures, reusable business frameworks, and application-facing contracts are defined.

It is not the platform core.

It is not the runtime host.

It is the layer where businesses and applications become organized, governed, communicable, and reusable.

## Relationship to ASC

ASC core remains responsible for:

- governance
- lifecycle
- deployment state
- settled state
- flows framework
- observability
- narrator
- strategist
- doctor
- AI worker orchestration
- shared platform rules and standards

`server-10-applications` is responsible for:

- application definitions
- tenant application structures
- business framework models
- business-facing modules
- interface contracts
- app policies
- tenant business canvases
- tenant business communications
- tenant strategy and business model structures

## Relationship to Server-02-App

`server-02-app` is the runtime host.

It owns:

- deployment wrappers
- nginx
- systemd
- runtime bootstrap
- runtime security
- runtime operations
- runtime health checks
- application hosting and delivery

`server-10-applications` owns the application and business definition side.

A simple rule:

- `server-02-app` runs applications
- `server-10-applications` defines applications

## Core Principle

The application plane must not rewrite the platform.

Applications may use platform flows, observability, governance interfaces, and AI worker capabilities.

Applications may not replace platform lifecycle, deployment-state, governance, narrator, doctor, or settled-state truth.

## Current Conceptual Structure

At this time, `server-10-applications` is organized into three major layers:

### 1. Application plane governance and contracts

This includes structures such as:

- `policies/`
- `interfaces/`
- `intake/`
- `flows/`

These define the rules, interfaces, and admission patterns of the application plane itself. :contentReference[oaicite:1]{index=1}

### 2. Shared reusable business intelligence

This is primarily:

- `business-framework/`

This directory contains reusable business thinking structures such as:

- communications
- business model structures
- nine building blocks
- future canvases and perspectives

This is the shared blank canvas and reusable logic layer. :contentReference[oaicite:2]{index=2}

### 3. Tenant-specific business and application realities

This is primarily:

- `apps/africamapping/`
- `apps/realestate-ai/`

These are the tenant-specific business/application spaces where the reusable framework becomes real business meaning. :contentReference[oaicite:3]{index=3}

## Current Top-Level Structure

```text
server-10-applications/
├── README.md
├── apps/
├── business-framework/
├── flows/
├── intake/
├── interfaces/
└── policies/
