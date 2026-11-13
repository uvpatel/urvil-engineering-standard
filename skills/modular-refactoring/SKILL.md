---
name: modular-refactoring
description: Refactor monolithic or difficult-to-maintain code into cohesive modules while preserving behavior. Use when files or components have multiple responsibilities or duplicated logic.
---

# Modular Refactoring

## Goals

Improve cohesion, readability, testability, and reuse without creating needless abstraction.

## Procedure

1. Inspect the full call graph and current behavior.
2. Identify responsibilities and dependencies.
3. Record behavior that must remain unchanged.
4. Propose extraction boundaries and exact file changes.
5. Obtain approval before substantial refactoring.
6. Extract one responsibility at a time.
7. Keep public interfaces stable unless a change is approved.
8. Remove duplication only after identifying the canonical implementation.
9. Update tests and imports.
10. Verify behavior and inspect the final diff.

## Component guidance

Consider separating:
- Presentational sections.
- Complex state orchestration.
- Data fetching.
- Validation.
- Domain/business rules.
- Reusable hooks.
- Persistence and external integrations.

## Avoid

- Splitting every JSX element into its own file.
- Creating generic `helpers.ts` or `utils.ts` dumping grounds.
- Extracting one-use code when it reduces clarity.
- Changing styling, behavior, or API contracts during a structural refactor without approval.
- Treating line count as the sole quality metric.

## Completion

Explain the new module boundaries and confirm which behavior was tested.
