# Code Quality Standards

- Optimize for clarity, correctness, and maintainability before cleverness.
- Keep functions and components focused on one coherent responsibility.
- Prefer explicit control flow and early returns where they improve readability.
- Avoid deeply nested conditionals; extract named predicates or functions when useful.
- Avoid duplicated business rules. Reuse a single source of truth.
- Avoid speculative abstractions and generic frameworks for one use case.
- Do not add comments that merely restate code. Explain non-obvious intent, constraints, or trade-offs.
- Do not leave required functionality as TODOs, placeholders, fake data, or no-op handlers.
- Handle errors intentionally; do not swallow exceptions or show raw internals to users.
- Avoid boolean-prop explosions. Prefer composition or explicit variants.
- Avoid premature `useMemo`, `useCallback`, and memoization. Measure or identify a concrete need.
- Keep side effects at clear boundaries.
- Preserve existing behavior unless a behavior change is approved.
- Do not suppress lint/type errors with disable comments or casts without explaining and containing the reason.
