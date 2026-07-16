# Workbench Architecture

This document defines the **authoritative architecture** of Workbench.

It specifies the architectural structure, boundaries, responsibilities, constraints, and governance of the repository.

This document intentionally describes **what the architecture is**.

The reasoning behind these decisions is documented in **ARCHITECTURE_DESIGN_RATIONALE.md**.

Implementation-specific architectural decisions belong in `docs/adr/`.

---

# 1. Architectural Overview

Workbench consists of three complementary architectural systems.

```text
                    Workbench

        ┌────────────────────────────┐
        │    Runtime Architecture    │
        └────────────────────────────┘

        ┌────────────────────────────┐
        │ Engineering Governance     │
        └────────────────────────────┘

        ┌────────────────────────────┐
        │ Repository Governance      │
        └────────────────────────────┘
```

Each system serves a distinct purpose.

The Runtime Architecture executes software.

Engineering Governance captures engineering knowledge.

Repository Governance controls how the repository evolves.

These systems are intentionally independent.

---

# 2. Runtime Architecture

The Runtime Architecture defines the executable software system.

It is organized as a modular architecture composed of independently evolvable bounded contexts.

Each bounded context owns a single engineering capability and exposes explicit interfaces.

Current bounded contexts are:

| Context        | Responsibility                                                                  |
| -------------- | ------------------------------------------------------------------------------- |
| Platform       | Runtime platform concerns, dependency composition, configuration and lifecycle. |
| Identity       | Authentication, authorization, identities, permissions and trust boundaries.    |
| Frontend       | User-facing presentation and interaction.                                       |
| Backend        | Business capabilities, APIs and orchestration.                                  |
| AI             | AI providers, prompts, evaluations, agents and provider abstraction.            |
| Data           | Persistence, storage abstraction, schemas and migrations.                       |
| Messaging      | Events, asynchronous communication and messaging contracts.                     |
| Observability  | Logging, metrics, tracing, diagnostics and health reporting.                    |
| Testing        | Runtime testing infrastructure and verification support.                        |
| Delivery       | Packaging, releases and deployment orchestration.                               |
| Infrastructure | Compute, networking and infrastructure provisioning.                            |
| Operations     | Monitoring, backup, recovery and operational procedures.                        |
| Security       | Secure development, dependency security and cryptography.                       |

Each bounded context should remain independently evolvable whenever practical.

---

---

## 2.1 Runtime Component Architecture

Every runtime bounded context should be internally organized according to the same architectural model.

```text
                           ┌──────────────────────┐
                           │       Clients        │
                           │──────────────────────│
                           │ Web                  │
                           │ Mobile               │
                           │ CLI                  │
                           │ Automation           │
                           └──────────┬───────────┘
                                      │
                           Stable Public Contracts
                                      │
                   ┌──────────────────┴──────────────────┐
                   │                                     │
          ┌────────▼────────┐                 ┌──────────▼─────────┐
          │ Application API │                 │ Event Interfaces   │
          │ (Use Cases)     │                 │ Async Contracts    │
          └────────┬────────┘                 └──────────┬─────────┘
                   │                                     │
          ┌────────▼─────────────────────────────────────▼─────────┐
          │                    Domain Layer                        │
          │--------------------------------------------------------│
          │ Business Rules                                         │
          │ Policies                                               │
          │ Domain Services                                        │
          │ Aggregates                                             │
          └────────┬─────────────────────────────────────┬─────────┘
                   │                                     │
        ┌──────────▼─────────┐               ┌──────────▼──────────┐
        │ Infrastructure     │               │ Cross-Cutting       │
        │--------------------│               │---------------------│
        │ Database           │               │ Logging             │
        │ Cache              │               │ Metrics             │
        │ Messaging          │               │ Tracing             │
        │ Storage            │               │ Security            │
        │ External Services  │               │ Configuration       │
        └──────────┬─────────┘               └──────────┬──────────┘
                   │                                    │
                   └──────────────────┬─────────────────┘
                                      │
                           Deployment Platform
```

### Clients

Clients represent every supported mechanism for interacting with the system.

Examples include:

* Web applications
* Mobile applications
* Command-line interfaces
* Automation
* AI agents
* External systems

Clients communicate only through stable public contracts.

---

### Public Contracts

Public contracts define the stable interfaces exposed by a bounded context.

Examples include:

* HTTP APIs
* gRPC services
* GraphQL
* Event contracts
* CLI interfaces

Public contracts isolate consumers from internal implementation details.

---

### Application Layer

The Application Layer coordinates execution.

Responsibilities include:

* implementing use cases,
* request validation,
* orchestration,
* transaction boundaries,
* authorization,
* application workflows.

The Application Layer contains no business policy.

---

### Domain Layer

The Domain Layer contains the core business model.

Responsibilities include:

* entities,
* value objects,
* aggregates,
* domain services,
* business policies,
* invariants.

The Domain Layer is intentionally independent of infrastructure technologies.

---

### Infrastructure Layer

Infrastructure provides implementations of external dependencies.

Examples include:

* databases,
* caches,
* message brokers,
* storage,
* external APIs,
* AI providers.

Infrastructure may change without requiring modifications to domain behaviour.

---

### Cross-Cutting Services

Cross-cutting services provide capabilities used throughout the runtime system.

Examples include:

* logging,
* metrics,
* tracing,
* configuration,
* secrets,
* resilience,
* security.

These services support the runtime architecture without introducing business behaviour.

---

### Deployment Platform

The Deployment Platform hosts the runtime system.

Examples include:

* local development,
* containers,
* orchestration platforms,
* cloud environments,
* CI/CD infrastructure.

The runtime architecture should remain independent of deployment technology.

---

# 3. Engineering Governance

Engineering Governance defines how engineering knowledge is created, validated and preserved.

It consists of the repository's governance artifacts.

| Artifact              | Responsibility                                                      |
| --------------------- | ------------------------------------------------------------------- |
| Project Documentation | Defines the project's purpose, goals, principles and scope.         |
| Engineering Portfolio | Records demonstrated engineering capabilities backed by evidence.   |
| Engineering Cookbook  | Captures repeatable engineering practices.                          |
| ADRs                  | Records significant architectural decisions and their consequences. |
| Experiments           | Captures evidence produced through engineering experiments.         |

Engineering Governance is never part of the runtime system.

---

# 4. Repository Governance

Repository Governance defines how Workbench evolves.

It applies equally to human contributors and AI-assisted development.

Repository Governance consists of:

* Repository Invariants
* Ownership
* Change Workflow
* Architectural Fitness Functions
* Review Expectations
* Definition of Done

Repository Governance exists to preserve architectural integrity throughout the lifetime of the repository.

---

# 5. Architectural Layers

Every runtime bounded context should internally follow the same logical architecture whenever applicable.

```text
Client

↓

Application

↓

Domain

↓

Infrastructure
```

Cross-cutting capabilities such as observability, security and configuration support these layers but do not violate dependency direction.

---

# 6. Dependency Rules

The following dependency rules apply repository-wide.

* Dependencies point toward stable abstractions.
* Domain logic must remain independent of infrastructure.
* Runtime code must never depend on governance artifacts.
* External technologies terminate at architectural boundaries.
* Cross-context communication occurs through explicit contracts.
* Hidden dependencies are prohibited.

---

# 7. Context Relationships

Bounded contexts communicate through explicit contracts.

Permitted communication patterns include:

* synchronous APIs,
* asynchronous events,
* shared contracts,
* published interfaces.

Communication through implementation details is prohibited.

Ownership of contracts remains explicit.

---

# 8. Repository Invariants

The following architectural invariants must always hold.

* Repository organization reflects engineering concerns rather than technologies.
* Every architectural component has a single primary responsibility.
* Every long-lived dependency has documented justification.
* Architectural evolution is incremental and reversible.
* Experiments remain isolated until validated.
* Engineering knowledge is preserved within the repository.
* No implementation depends upon a specific AI assistant.

Violation of an invariant requires explicit architectural justification.

---

# 9. Architectural Constraints

Workbench intentionally remains independent of:

* programming languages,
* frameworks,
* IDEs,
* AI assistants,
* LLM providers,
* cloud providers,
* databases,
* messaging systems,
* observability platforms,
* deployment platforms.

No architectural component may assume any particular implementation technology unless justified by an explicit architectural decision.

---

# 10. Evolution Strategy

Workbench evolves through continuous architectural refinement.

The preferred order of evolution is:

1. Understand the problem.
2. Gather evidence.
3. Design the smallest appropriate change.
4. Record architectural decisions when necessary.
5. Implement incrementally.
6. Verify correctness.
7. Capture engineering knowledge.

Architectural evolution should always prefer:

* evolution over rewrites,
* extraction over duplication,
* modularization over premature distribution,
* measurement over assumption,
* automation over repetition.

---

# 11. AI Collaboration Model

AI is considered an engineering collaborator rather than the repository's author.

AI may assist with:

* analysis,
* decomposition,
* implementation,
* review,
* testing,
* documentation.

AI must respect the repository architecture.

AI must not:

* introduce architectural drift,
* duplicate existing abstractions,
* violate repository invariants,
* restructure bounded contexts without justification,
* bypass established governance.

Architectural decisions already accepted by the repository should be treated as authoritative until superseded by new evidence.

---

# 12. Relationship to Other Repository Artifacts

This document defines the architecture.

The companion artifacts have distinct responsibilities.

| Artifact                      | Purpose                                             |
| ----------------------------- | --------------------------------------------------- |
| Project Documentation         | Defines why the project exists.                     |
| Architecture Design Rationale | Explains why the architecture is designed this way. |
| ADRs                          | Record individual architectural decisions.          |
| Engineering Portfolio         | Demonstrates engineering competence.                |
| Engineering Cookbook          | Captures repeatable engineering practices.          |

These documents are complementary and should not duplicate one another.

---

# 13. Authority

This document is the authoritative specification of the Workbench architecture.

Implementation should conform to this architecture.

Architectural evolution should occur by updating this document, recording supporting ADRs where appropriate, and preserving the reasoning in **ARCHITECTURE_DESIGN_RATIONALE.md**.
