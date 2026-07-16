## License

Copyright © 2026 Sameer Mudaye

Licensed under the Apache License, Version 2.0. See the LICENSE file for details.

# Workbench

Workbench is a long-lived software engineering laboratory.

Its purpose is **not** to build a commercially successful product.

Its purpose is to develop practical software engineering competence through deliberate, hands-on implementation of modern engineering practices.

Every engineering decision in this repository is evaluated primarily by how much it contributes to learning transferable engineering principles rather than how quickly it delivers features.

---

# Guiding Principles

Workbench is built around a small set of principles that govern every engineering decision.

* Engineering principles over technologies.
* Production quality over feature quantity.
* Practice over theory.
* Evidence over opinion.
* Evolution over rewrites.
* Small, reversible changes.
* Automation wherever repeatability matters.
* Repository as the source of truth.
* Every technology must justify its inclusion by improving the learning objectives.

The repository intentionally remains independent of any particular programming language, framework, IDE, AI assistant, cloud provider, infrastructure vendor, or deployment platform.

---

# Repository Philosophy

Most repositories are organized around the technologies they use.

Workbench is organized around the engineering disciplines it practices.

Languages, frameworks and infrastructure will change throughout the lifetime of the project.

Engineering concerns such as architecture, testing, deployment, observability and operations remain.

The repository structure therefore reflects stable engineering concepts rather than transient implementation choices.

Documentation owns the narrative. Assets support the narrative.

---

# Repository Structure

```text
Workbench/
│
├── governance/
│   ├── Project Documentation
│   ├── Engineering Portfolio
│   └── Engineering Cookbook
│
├── docs/
│   ├── adr/
│   ├── architecture/
│   ├── diagrams/
│   └── experiments/
│
├── platform/
├── applications/
├── services/
├── libraries/
├── contracts/
├── testing/
├── scripts/
├── tools/
├── assets/
├── examples/
│
├── .github/
├── README.md
└── LICENSE
```

---

# Governance

The `governance/` directory contains the repository's institutional artifacts.

These documents define how the project operates, how engineering competence is measured, and how engineering knowledge is captured. They evolve with the project but are intentionally few in number.

## Project Documentation

Defines the project's purpose, goals, principles, constraints and scope.

It answers:

> **Why does this repository exist?**

---

## Engineering Portfolio

An evidence-backed record of engineering capabilities developed throughout the project.

Capabilities are recorded only after they have been demonstrated and supported by repository evidence.

It answers:

> **What engineering competence has been demonstrated?**

---

## Engineering Cookbook

A collection of verified, repeatable engineering recipes developed while building Workbench.

Recipes are added only after they have been successfully executed and validated.

It answers:

> **How can this engineering task be reproduced?**

---

# Supporting Documentation

The `docs/` directory contains documentation produced while engineering the system.

Unlike the governance artifacts, these documents support implementation and architectural evolution rather than defining the project itself.

### adr/

Architectural Decision Records.

Every significant engineering decision should be documented together with its rationale, alternatives and consequences.

### architecture/

System descriptions, architecture views, deployment models and component documentation.

### diagrams/

Architecture, sequence, deployment and other engineering diagrams.

### experiments/

Workbench is an engineering laboratory.

Each experiment should document:

* hypothesis
* implementation
* observations
* evidence
* conclusions

Experiments exist to improve engineering judgment through evidence.

---

# Platform

Everything required to build, deploy, operate and secure the system.

Examples include infrastructure, deployment, observability, security and local development.

---

# Applications

Executable applications that expose system capabilities.

Applications are entry points.

Reusable functionality belongs in libraries.

---

# Services

Independent deployable services.

This directory may initially remain empty.

Services should emerge only when architectural evidence justifies decomposition.

---

# Libraries

Reusable components shared across applications and services.

Examples include shared domain models, utilities, adapters and SDKs.

---

# Contracts

Explicit definitions of communication between independent components.

Examples include API specifications, event schemas and protocol definitions.

---

# Testing

Repository-level testing assets.

Examples include integration, contract, end-to-end and performance testing.

Unit tests typically remain close to implementation.

---

# Scripts

Repository automation.

Any engineering task that is executed repeatedly should eventually become a script.

---

# Tools

Developer tooling that supports engineering work.

These are engineering utilities rather than production components.

---

# Assets

The `assets/` directory contains binary and media resources that support the repository but are not part of the software implementation.

These assets are referenced by documentation, architecture artifacts, presentations, demonstrations, and other repository materials.

Examples include:

- Architecture diagrams
- Images and screenshots
- Logos and branding assets
- Presentation media
- Demonstration recordings

Assets should be organized by purpose rather than by file type.

This directory should not contain generated artifacts or build outputs.

## Suggested Structure

assets/
├── diagrams/
├── images/
├── logos/
└── presentations/

---

# Examples

Reference implementations, prototypes and learning exercises.

Experiments should remain isolated from production code whenever practical.

---

# Why This Structure?

This repository intentionally avoids organizing itself around implementation technologies such as:

* react
* spring
* terraform
* kubernetes
* node
* python

Directories named after frameworks or vendors tend to become liabilities as systems evolve.

Instead, the repository is organized around enduring engineering concerns.

As programming languages, frameworks, cloud providers, AI assistants and infrastructure change, the repository structure should remain largely stable.

The objective is not to preserve today's technology choices.

The objective is to preserve engineering knowledge.

These are implementation choices.

They may change many times throughout the lifetime of the repository.

Engineering disciplines change far less frequently.

By organizing around engineering concerns rather than technologies, the repository can evolve without requiring continual restructuring.

This encourages architectural evolution instead of architectural rewrites.

---

# Repository Evolution

The repository is expected to evolve continuously.

Applications may be replaced.

Services may be added or removed.

Infrastructure may migrate between cloud providers.

Programming languages may change.

AI assistants may change.

The repository structure should remain largely stable because it reflects enduring engineering concerns rather than implementation details.

The objective is not to preserve today's technology choices.

The objective is to preserve engineering knowledge.
