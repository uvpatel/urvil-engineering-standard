---
name: nextjs-feature-engineering
description: Design and implement full-stack features in Next.js 16+ App Router applications using React 19, Server Components first, and strict module boundaries. Use when creating pages, route handlers, server actions, or data flow in Next.js.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Next.js Feature Engineering

## Core Architecture Principles

1. **Server Components by Default:** Keep data fetching and secrets on the server. Place `"use client"` boundaries strictly at leaf components requiring browser interactivity.
2. **Next.js 16+ Async APIs:** In Next.js 16+, asynchronously await dynamic route params (`await params`, `await searchParams`, `await cookies()`, `await headers()`).
3. **Thin Route Entry Points:** Keep `page.tsx` focused on route composition and server data fetching. Delegate business logic and heavy UI to domain modules.
4. **Mutations via Server Actions:** Use Server Actions for mutations, always validating arguments server-side with Zod and verifying Better Auth sessions.
5. **Waterfall Prevention:** Fetch independent data in parallel with `Promise.all()` to eliminate request waterfalls.

## Workflow

1. **Inspect & Plan:** Verify installed Next.js and React versions. Map routes, existing components, and data flow. For substantial features, write a plan and wait for approval.
2. **Implement Data Layer:** Define Zod schemas and service functions handling database queries (PostgreSQL/Drizzle or MongoDB/Mongoose).
3. **Compose UI:** Build accessible UI using existing shadcn/ui components, Tailwind CSS v4, and Tabler Icons (`@tabler/icons-react`).
4. **Handle UI States:** Ensure Suspense loading (`loading.tsx`), error boundaries (`error.tsx`), empty states, and 404s (`not-found.tsx`) are handled.
5. **Verify:** Run `bun run typecheck`, `bun run lint`, and tests.

## Reference Patterns

For detailed code patterns, async request handling, and Server Action examples, consult [Next.js Engineering Patterns](references/nextjs-patterns.md).
