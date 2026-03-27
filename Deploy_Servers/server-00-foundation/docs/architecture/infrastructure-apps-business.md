# Infrastructure, Applications, and Business

## Overview

This document defines the relationship between the deploy group, infrastructure, applications, and business.

It ensures clear separation of concerns and alignment across the entire system.

---

## 1. Deploy Group (Founding Layer)

The deploy group is the originating stewardship layer behind the constellation.

It may be small, hidden, or evolving, but it is responsible for:

- establishing the system
- defining doctrine
- deploying the constellation
- guiding early evolution
- maintaining structural integrity

The deploy group does not operate the system directly for end users.

It creates and maintains the system that others rely on.

---

## 2. Infrastructure Layer

The Agentic Server Constellation is the infrastructure layer.

Once deployed, it becomes a living, governed platform.

Infrastructure provides:

- stability
- governed execution
- runtime flows
- observability
- system memory
- controlled evolution (via Governance Loop)

Infrastructure does not directly create customer value.

It serves applications.

---

## 3. Application Layer

Applications consume infrastructure.

Applications must remain:

- modular
- fast
- isolated
- independent of infrastructure internals

Applications interact with infrastructure through defined interfaces.

Applications:

- send events
- receive outputs
- create functional behavior

### Separation Principle

Applications must not spill into infrastructure.  
Infrastructure must not spill into applications.

This ensures:

- speed in applications
- stability in infrastructure

---

## 4. Business Layer

Businesses consume applications and infrastructure to create real-world value.

Example:
AfricaMapping is a business that consumes:

- infrastructure (constellation)
- applications (built on top of it)

Business is responsible for:

- defining customer value
- shaping product direction
- reaching users and markets
- converting system capability into outcomes

---

## 5. Flow of Value

The system operates as a layered flow:

Deploy Group  
→ Infrastructure  
→ Applications  
→ Business  
→ Customers

---

## 6. Core Principle

Infrastructure serves applications.  
Applications serve business.  
Business serves people and markets.  

The deploy group safeguards the integrity of the whole.

---

## 7. Relationship to Governance Loop

The Governance Loop (Narrator → Strategist → Governor):

- observes infrastructure
- interprets system behavior
- guides evolution
- enforces safe change

It ensures that:

- infrastructure evolves correctly
- applications remain aligned
- business impact remains stable and meaningful

---

## 8. Outcome

This structure enables:

- clean separation of concerns
- faster application development
- stable infrastructure evolution
- scalable business creation
- long-term system integrity
