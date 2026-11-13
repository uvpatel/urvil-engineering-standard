---
name: nextjs-feature-engineering
description: Design and implement features in an existing Next.js App Router application using current project conventions, server-first React, and clear module boundaries.
---

# Next.js Feature Engineering

## Before coding

- Discover the installed Next.js and React versions.
- Read relevant route, layout, component, server, and test code.
- Plan exact file changes and obtain approval for substantial work.

## Architecture

- Use App Router when already selected.
- Server Components by default.
- Keep `"use client"` at the smallest interactive boundary.
- Keep database access and secrets in server-only modules.
- Keep route files focused on route composition and framework conventions.
- Select Server Actions, Route Handlers, and client fetching based on the use case.

## Data flow

- Avoid waterfalls; parallelize independent reads.
- Validate all mutation inputs on the server.
- Return minimal, typed DTOs.
- Handle loading, empty, error, unauthorized, and not-found states.
- Use caching/revalidation intentionally for the installed Next.js version.

## Implementation

- Reuse existing components and design tokens.
- Keep UI, validation, domain logic, and persistence separated where useful.
- Avoid duplicate fetching and duplicated business rules.
- Preserve existing route behavior and SEO metadata.

## Verify

Run available lint, typecheck, tests, and build scripts. Inspect the diff and report exact outcomes.
