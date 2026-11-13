---
name: performance-audit
description: Audit a Next.js and React application's runtime, bundle size, Core Web Vitals, data fetching waterfalls, and database query performance. Use when diagnosing slow page loads, high memory usage, heavy client bundles, or database latency.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Performance Audit

## Measure Before Optimizing

1. **Identify Concrete Symptoms:** Establish clear user-visible symptoms or target metrics before modifying code.
2. **Collect Baselines:** Measure existing Core Web Vitals (LCP, INP, CLS), bundle sizes, or API response times.
3. **Evidence-Based Findings:** Back every identified issue with concrete evidence (profiler traces, query plans, bundle analysis).
4. **No Speculative Micro-Optimizations:** Avoid premature memoization (`useMemo`, `useCallback`) without measured impact.

## Audit Areas

- **Core Web Vitals:** Verify LCP (<2.5s), INP (<200ms), and CLS (<0.1) across key user routes.
- **RSC & Bundle Footprint:** Ensure client boundaries (`"use client"`) are confined to leaf components. Check for heavy dependencies.
- **Request Waterfalls:** Identify chained sequential `await` calls that should be executed concurrently via `Promise.all()`.
- **Database Query Hygiene:** Check for missing indexes, missing `.lean()` on Mongoose queries, unpaginated reads, and missing field projections.

## Approval Gate

Do not implement performance refactors without presenting an audit report and receiving explicit developer approval.

## Detailed Checklist

For a comprehensive performance inspection checklist and report format, consult [Performance Audit Checklist](references/audit-checklist.md).
