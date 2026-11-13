---
name: code-review
description: Review code changes for correctness, maintainability, security, accessibility, performance, and consistency with the approved plan.
---

# Code Review

## Review method

1. Read the approved plan and acceptance criteria.
2. Inspect the full diff, not only the final snippets.
3. Trace affected callers, data flow, and failure paths.
4. Check for regressions and unintended scope expansion.
5. Run available focused checks when requested/appropriate.

## Priority order

- Critical: security vulnerabilities, data loss, authorization bypass, broken core flow.
- High: correctness bugs, race conditions, severe accessibility issues, major performance regressions.
- Medium: maintainability, missing edge cases, inconsistent contracts.
- Low: naming, minor style, optional cleanup.

## Findings format

For each finding include:
- Severity.
- File and line/location.
- Concrete issue and why it matters.
- Reproduction or scenario.
- Suggested correction.

Do not report speculative concerns as confirmed bugs. Separate blockers from suggestions. Avoid nitpicks that do not improve the code.
