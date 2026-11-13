---
name: performance-audit
description: Audit a Next.js/React application's runtime, bundle, rendering, data access, and database performance, then propose evidence-based improvements.
---

# Performance Audit

## Audit before optimizing

1. Identify user-visible performance symptoms and target metrics.
2. Inspect installed versions and existing performance tooling.
3. Map route rendering and client/server boundaries.
4. Inspect network waterfalls, bundle composition, expensive renders, and database query patterns where tools/data are available.
5. Establish a baseline before changes.

## Review areas

- Client JavaScript and client component boundaries.
- Request waterfalls and duplicate requests.
- Image/font loading and layout shifts.
- Heavy dependencies and code splitting.
- React state scope and unnecessary rerenders.
- Database indexes, projections, pagination, and N+1 queries.
- Cache correctness, invalidation, and privacy.
- Third-party scripts and external service latency.

## Output

Use a prioritized list: issue, evidence, user impact, proposed fix, risk, and verification method.

## Approval

Do not implement optimizations until the developer approves the plan. Do not claim gains without measurement.
