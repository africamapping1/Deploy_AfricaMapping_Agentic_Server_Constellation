# Team Structure and Governance

## 1. Overview

AfricaMapping is structured into capability-based teams aligned with system architecture.

Each team owns a specific domain and operates within a governed lifecycle.

---

## 2. Core Teams

### 2.1 Display Engine Team
Owns:
- display-engine
- dashboard
- profiles
- rendering and interaction

---

### 2.2 Imagery Team
Owns:
- imagery program
- external imagery access
- internal processing
- tile generation

---

### 2.3 Foundational GIS Team
Owns:
- water
- land cover
- buildings

Responsible for creating reusable spatial layers.

---

### 2.4 Composite GIS Team
Owns:
- addresses
- future composite programs

Builds higher-level GIS products from foundational layers.

---

### 2.5 Frontend / Experience Team
Owns:
- user-facing applications
- AfricaMapping web experience
- UI/UX integration

---

### 2.6 Infrastructure Team
Owns:
- Linode
- CI/CD pipelines
- nginx
- systemd
- deployment processes

---

### 2.7 Governance / ASC Team
Owns:
- policies
- lifecycle decisions
- approval processes
- system-wide coordination

---

## 3. Governance Lifecycle

All teams operate under:

intake → examine → approve → execute → observe → learn

---

## 4. CI/CD Governance

### Principles
- No direct changes to main without visibility
- All changes reviewed
- Deployment controlled

### Freeze Levels

1. Soft Freeze — limited changes  
2. Hard Freeze — no merges  
3. Release Freeze — approved changes only  

Governance Team controls freeze.  
Infrastructure Team enforces it.

---

## 5. Ownership Model

Each team:
- owns its folders
- owns its programs
- is responsible for quality and evolution

---

## 6. System Alignment

Teams align with system layers:

Display Engine  
Imagery  
Foundational Programs  
Composite Programs  
Governance  
Infrastructure  

---

## 7. Final Principle

One team = one capability = one ownership boundary.
