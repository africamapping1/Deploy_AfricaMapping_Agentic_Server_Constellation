# Team → Program → Folder Mapping

## 1. Overview

This document defines the direct relationship between:

- Teams
- Programs
- Repository folders

It establishes ownership boundaries and prevents overlap and confusion.

---

## 2. Mapping Structure

Each team:

- owns specific folders
- owns specific programs
- is responsible for development, quality, and evolution within those boundaries

---

## 3. Team Ownership Mapping

---

### 3.1 Display Engine Team

**Owns Folder:**
Deploy_Servers/server-10-applications/display-engine/

**Owns Components:**
- dashboard/
- profiles/
- prototypes/
- models/
- controllers/
- views/
- widgets/
- services/

**Responsibilities:**
- rendering engine
- profile system
- layer control logic
- basemap adapters
- dashboard configuration and preview

---

### 3.2 Imagery Team

**Owns Folder:**
Deploy_Servers/server-10-applications/gis-framework/programs/imagery/

**Owns Components:**
- inputs/
- processing/
- tiles/
- providers/
- profiles/

**Responsibilities:**
- imagery intake
- external imagery integration
- internal processing pipelines
- tile generation
- imagery delivery

---

### 3.3 Foundational GIS Team

**Owns Folder:**
Deploy_Servers/server-10-applications/gis-framework/programs/

**Owns Programs:**
- water/
- land-cover/
- buildings/

**Responsibilities:**
- spatial layer creation
- extraction workflows
- data validation
- dataset quality improvement

---

### 3.4 Composite GIS Team

**Owns Folder:**
Deploy_Servers/server-10-applications/gis-framework/programs/

**Owns Programs:**
- addresses/
- future composite programs

**Responsibilities:**
- combining foundational layers
- building relationships (e.g., address → building)
- creating application-level GIS outputs

---

### 3.5 Frontend / Experience Team

**Owns Folder:**
Deploy_Servers/server-10-applications/apps/

**Owns Components:**
- africamapping website
- frontend UI layers
- user interaction flows

**Responsibilities:**
- user-facing applications
- UI/UX design
- integration of display engine into products

---

### 3.6 Infrastructure Team

**Owns Folder:**
Deploy_Servers/

**Owns Components:**
- server-01-bastion/
- server-02-app/
- server-03-db/
- server-04-storage/
- server-05-ci-cd/
- server-06-monitoring/

**Responsibilities:**
- deployment
- CI/CD pipelines
- server setup
- nginx, systemd
- environment management

---

### 3.7 Governance / ASC Team

**Owns Folder:**
Deploy_Servers/server-07-ai-orchestrator/
Deploy_Servers/server-10-applications/governance/

**Owns Components:**
- policies/
- lifecycle/
- rules/
- narrator, doctor, strategist outputs

**Responsibilities:**
- lifecycle governance
- approvals
- decision tracking
- system-wide coordination

---

## 4. Interaction Rules

### 4.1 No Cross-Team Direct Modification

Teams should not modify another team’s folder directly.

Instead:
- propose changes
- submit requests
- go through governance if needed

---

### 4.2 Shared Interfaces

Teams interact through:

- profiles
- data outputs (GeoJSON, tiles)
- APIs (future)
- defined contracts

---

### 4.3 Display Engine as Shared Service

All GIS programs:
- consume the display engine
- do not modify its internal logic directly

---

## 5. Example Flow

Imagery Team
    ↓
provides imagery
    ↓
Foundational GIS Team
    ↓
produces buildings
    ↓
Composite GIS Team
    ↓
creates addresses
    ↓
Display Engine Team
    ↓
renders output
    ↓
Frontend Team
    ↓
delivers user experience

Governance oversees all steps  
Infrastructure supports all steps  

---

## 6. Ownership Enforcement

- Folder ownership = team responsibility
- Changes must be visible and reviewed
- CI/CD rules enforce boundaries

---

## 7. Final Principle

Clear ownership enables scalability.

Each team builds independently but integrates through defined interfaces.
