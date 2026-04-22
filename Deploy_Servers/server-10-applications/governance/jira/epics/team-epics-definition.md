# Jira Epics — Team-Aligned Definition

## 1. Overview

This document defines Jira Epics aligned with:

- Teams
- Programs
- Platform capabilities

Each Epic represents a major capability area and is owned by a team.

---

## 2. Display Engine Team Epics

### EPIC: Display Engine Core

Description:
Build and stabilize the core display engine including rendering, layering, and interaction.

Includes:
- map initialization
- layer rendering
- layer ordering
- opacity controls
- popup system

---

### EPIC: Profile System

Description:
Develop reusable display profiles for consistent configuration.

Includes:
- profile JSON structure
- profile loading
- profile validation
- profile reuse

---

### EPIC: Dashboard (Config + Preview + Dispatch)

Description:
Create the dashboard as the display manager workspace.

Includes:
- configuration UI
- live preview (embedded map)
- profile selection
- dispatch capability
- triage for unsupported features

---

### EPIC: Basemap Adapter Layer

Description:
Support multiple basemap providers.

Includes:
- OSM
- imagery providers
- future adapters (Sentinel-derived, etc.)

---

## 3. Imagery Team Epics

### EPIC: External Imagery Integration

Description:
Support external imagery sources.

Includes:
- tile providers
- attribution handling
- adapter design

---

### EPIC: Internal Imagery Processing Pipeline

Description:
Build in-house imagery processing capability.

Includes:
- ingestion
- preprocessing
- reprojection
- clipping
- enhancement

---

### EPIC: Tile Generation System

Description:
Convert imagery into tile services.

Includes:
- tile pyramid generation
- storage
- access structure

---

### EPIC: Imagery Serving

Description:
Serve imagery to display engine and programs.

Includes:
- tile endpoints
- integration with display engine
- performance considerations

---

## 4. Foundational GIS Team Epics

### EPIC: Buildings Program

Description:
Develop building extraction and dataset.

Includes:
- digitization
- validation
- improvement workflows

---

### EPIC: Land Cover Program

Description:
Develop land cover classification.

Includes:
- classification logic
- dataset generation
- refinement

---

### EPIC: Water Program

Description:
Develop water body detection.

Includes:
- extraction
- validation
- dataset improvements

---

### EPIC: Data Quality and Validation

Description:
Ensure accuracy and reliability of foundational data.

Includes:
- QA workflows
- validation rules
- review cycles

---

## 5. Composite GIS Team Epics

### EPIC: Addresses Program

Description:
Develop address system based on buildings.

Includes:
- address points
- building linkage
- popup display
- refinement

---

### EPIC: Address-Building Relationship

Description:
Strengthen relationship between addresses and buildings.

Includes:
- spatial linking
- validation
- multiple addresses per building

---

### EPIC: Future GIS Programs

Description:
Prepare framework for new composite programs.

Includes:
- program templates
- integration patterns
- reuse of foundational layers

---

## 6. Frontend / Experience Team Epics

### EPIC: AfricaMapping Web Platform

Description:
Build user-facing web platform.

Includes:
- homepage
- navigation
- content

---

### EPIC: Map Experience Integration

Description:
Integrate display engine into frontend.

Includes:
- embedding viewer
- UI controls
- interaction design

---

### EPIC: Address Search Experience

Description:
Build address search UI.

Includes:
- search bar
- results display
- interaction with map

---

## 7. Infrastructure Team Epics

### EPIC: Deployment Pipeline

Description:
Build CI/CD pipeline.

Includes:
- GitHub Actions
- deployment scripts
- automation

---

### EPIC: Web Serving (nginx)

Description:
Serve platform via nginx.

Includes:
- static serving
- routing
- domain setup

---

### EPIC: System Services (systemd)

Description:
Manage services.

Includes:
- service definitions
- restart policies
- logging

---

### EPIC: Monitoring and Health

Description:
Monitor system health.

Includes:
- logs
- alerts
- performance checks

---

## 8. Governance / ASC Team Epics

### EPIC: Lifecycle Management

Description:
Implement governance lifecycle.

Includes:
- intake
- review
- approval
- execution tracking

---

### EPIC: Policy Framework

Description:
Define system policies.

Includes:
- rules
- constraints
- enforcement model

---

### EPIC: SAM Integration

Description:
Integrate service availability matrix.

Includes:
- tracking maturity
- readiness metrics

---

### EPIC: Narrator and Reporting

Description:
Track system history and reporting.

Includes:
- activity logs
- summaries
- insights

---

## 9. Final Principle

Epics represent capability ownership.

Each Epic:
- belongs to a team
- maps to a program or system function
- is executed through stories and tasks
