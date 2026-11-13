---
name: modular-refactoring
description: Refactor monolithic or difficult-to-maintain code into small, cohesive, and reusable modules while strictly preserving behavior. Use when files exceed 300-500 lines, mix multiple responsibilities, or have duplicated business logic.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Modular Refactoring

## Objectives

- **Improve Cohesion:** Ensure each module, component, and function has one clear responsibility.
- **Enforce Module Boundaries:** Separate UI presentation from business calculations, validation schemas, and database queries.
- **Preserve Behavior:** Zero changes to user-visible behavior, CSS layout, or public API contracts without explicit developer approval.

## Non-Negotiable Guardrails

1. **Approval Required:** For substantial structural refactors, prepare an implementation plan outlining extraction boundaries and wait for explicit developer approval.
2. **No Monolithic Files:** Break down 500-line god components into cohesive sub-components, custom hooks, and domain services.
3. **No Catch-All Dumps:** Avoid creating generic `utils.ts` or `helpers.ts` files. Name modules after their domain responsibility.
4. **No Premature Abstraction:** Do not invent complex generic patterns for code used in only one place.

## Refactoring Protocol

1. **Map Current Behavior:** Trace the full call graph, state lifecycles, and edge-case handling.
2. **Define Boundaries:** Identify extraction candidates:
   - Presentation sections (sub-components)
   - Complex state and effects (custom hooks)
   - Business calculations and transformations (pure functions)
   - Validation and types (Zod schemas and domain interfaces)
3. **Extract Incrementally:** Extract one cohesive unit at a time, keeping interfaces stable.
4. **Verify Behavior:** Run `bun run typecheck`, `bun run lint`, and tests. Inspect `git diff` carefully to confirm no unintended alterations.

## Reference Patterns

For detailed extraction techniques and file organization patterns, consult [Modular Refactoring Patterns](references/refactoring-patterns.md).
