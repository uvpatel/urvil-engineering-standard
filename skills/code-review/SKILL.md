---
name: code-review
description: Review code changes for correctness, maintainability, security, accessibility, performance, and adherence to approved plans. Use when reviewing pull requests, inspecting git diffs, or verifying code quality before completion.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Code Review

## Review Methodology

1. **Plan & Requirements First:** Review the approved implementation plan and acceptance criteria before inspecting code.
2. **Inspect the Full Diff:** Review the entire `git diff`, not just isolated code snippets.
3. **Trace Invariants:** Trace edge cases, unauthenticated paths, and error scenarios.
4. **Order by Severity:** Prioritize feedback by severity (Critical → High → Medium → Low).

## Severity Hierarchy

- **Critical:** Security vulnerabilities (auth bypass, IDOR, injection), data corruption, or broken core journeys.
- **High:** Correctness bugs, race conditions, request waterfalls, severe accessibility barriers.
- **Medium:** Modularity violations (monolithic files >300-500 lines), missing loading/error UI states, unpaginated queries.
- **Low:** Minor naming inconsistencies or non-blocking cleanup suggestions.

## Findings Format

For each substantive finding, provide:
- **Severity & Location:** `[Severity] path/to/file.ts:line`
- **Issue:** Clear explanation of what is wrong and its impact.
- **Scenario:** Concrete scenario or input triggering the failure.
- **Suggested Fix:** Concrete code example showing the recommended correction.

## Detailed Checklist

For the complete review checklist across security, Next.js, and accessibility, consult [Code Review Checklist](references/review-checklist.md).
