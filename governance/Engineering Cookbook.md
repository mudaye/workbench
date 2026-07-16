# Engineering Cookbook v0.1

## Purpose

The Engineering Cookbook is a collection of reproducible engineering recipes developed while building Workbench.

Every recipe must be:

* Practiced.
* Verified.
* Repeatable.
* Reversible (where applicable).
* Referenced by evidence in the repository.

Recipes are added only after they have been successfully executed.

---

# Recipe Template

## Title

### Objective

### When to Use

### Prerequisites

### Steps

### Verification

### Rollback / Cleanup

### Common Pitfalls

### References

### Evidence

---

# Bootstrap

* Create repository.

## Title

**Bootstrap a New Workbench Repository**

### Objective

Establish the repository as an engineering laboratory before any implementation work begins.

### When to Use

When creating a new Workbench repository.

### Prerequisites

* Git installed
* GitHub repository created (optional)

### Steps

1. Create the repository.
2. Establish the repository directory structure.
3. Add the governance artifacts:

   * Project Documentation
   * Engineering Portfolio
   * Engineering Cookbook
4. Add the supporting engineering directories.
5. Add the README.
6. Add the LICENSE.
7. Add a minimal, technology-agnostic `.gitignore`.
8. Commit the repository baseline.
9. Tag the repository as **Bootstrap Complete (v0.1.0)**.

### Verification

Bootstrap is considered complete when:

* The repository contains no implementation code.
* The repository structure reflects engineering concerns rather than technology choices.
* Governance documents are present.
* The repository can begin engineering work without structural changes.
* No language, framework, cloud provider, editor, or AI tooling has been assumed.

### Rollback / Cleanup

Delete the repository or reset to the initial commit.

### Common Pitfalls

* Choosing implementation technologies during bootstrap.
* Adding build systems before they are justified.
* Configuring AI tooling before defining the engineering workflow.
* Organizing the repository around frameworks instead of engineering disciplines.
* Adding generated artifacts or environment-specific configuration.

### References

* Project Documentation
* Repository README

### Evidence

* Initial commit
* `v0.1.0` tag

---

* Configure development environment.
* Configure editor.
* Configure Git.
* Configure development containers.
* Configure local infrastructure.
* Configure Infrastructure as Code.
* Configure CI.
* Configure CD.

---

# Development

* Create a new service.
* Create a new frontend application.
* Create a new mobile application.
* Create a shared library.
* Add configuration.
* Add secrets.
* Add logging.
* Add tracing.
* Add metrics.
* Add health checks.

---

# Testing

* Add unit tests.
* Add integration tests.
* Add contract tests.
* Add end-to-end tests.
* Run the complete test suite.

---

# Infrastructure

* Provision local infrastructure.
* Provision AWS infrastructure.
* Provision Azure infrastructure.
* Provision GCP infrastructure.
* Deploy to Kubernetes.
* Roll back a deployment.

---

# AI

* Add an AI provider.
* Switch AI providers.
* Evaluate a new model.
* Add an AI agent.

---

# Operations

* Add a feature flag.
* Rotate secrets.
* Perform a database migration.
* Restore from backup.
* Diagnose production failures.

---

# Evolution

* Split a service.
* Merge services.
* Replace a database.
* Replace a message broker.
* Replace a cache.
* Replace an AI provider.
* Upgrade dependencies.
* Upgrade Kubernetes.

---

# Repository

Each completed recipe should reference:

* Related ADRs.
* Relevant commits.
* Relevant experiments.
* Related portfolio entries.
