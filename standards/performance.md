# Performance Standards

Optimize based on user impact and evidence, not arbitrary micro-optimizations.

## React and Next.js

- Minimize client component boundaries and shipped JavaScript.
- Prefer server rendering/data access when appropriate.
- Avoid request waterfalls; parallelize independent operations.
- Defer or lazy-load genuinely heavy, non-critical modules.
- Use image/font optimization and avoid layout shifts.
- Avoid unnecessary state, effects, rerenders, and context-wide updates.
- Use virtualization only when list size and measurements justify it.

## Data and infrastructure

- Select only required database fields.
- Add indexes based on query patterns and evidence.
- Bound result sets and use pagination.
- Cache only when freshness, privacy, and invalidation semantics are understood.
- Set timeouts for external dependencies and handle slow/failing services.

## Measurement

- Identify the metric and baseline before claiming improvement.
- Use bundle analysis, profiling, query plans, Lighthouse, or real-user metrics when appropriate.
- Report measured results separately from expected benefits.
