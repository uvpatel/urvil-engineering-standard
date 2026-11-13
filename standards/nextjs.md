# Next.js Standards

Use the installed Next.js version's documentation and APIs. Do not assume a feature from a newer release exists in the repository.

## App Router

- Use App Router when that is the approved project architecture.
- Keep `page.tsx` and `layout.tsx` focused on composition and route concerns.
- Use `loading.tsx`, `error.tsx`, `not-found.tsx`, and route-level boundaries when they improve UX and error isolation.
- Keep route groups and parallel/intercepting routes only when they serve a clear routing requirement.

## Server and client components

- Server Components are the default.
- Add `"use client"` only for browser APIs, client-side interaction, effects, or client-only libraries.
- Place the client boundary as low as practical.
- Do not pass non-serializable values across server/client boundaries.
- Keep database clients, secrets, and privileged services in server-only modules.

## Data and mutations

- Choose Server Components, Route Handlers, Server Actions, or client-side fetching based on the consumer and security/data-flow requirements.
- Avoid duplicate fetches and sequential waterfalls for independent data.
- Validate inputs on the server even when the client also validates.
- Use Route Handlers for HTTP endpoints/integrations and Server Actions for appropriate application mutations; do not force either pattern everywhere.
- Return minimal DTOs, not database documents or secrets.

## Caching

- Understand the installed Next.js version's caching defaults before changing behavior.
- Make cache, revalidation, and dynamic rendering decisions intentionally.
- Never cache user-specific or sensitive data publicly.
- Do not add cache directives or tags without understanding invalidation.
- Test freshness and isolation when caching is involved.

## Framework features

- Use `next/image` for appropriate image optimization.
- Use `next/font` or the project's approved font strategy.
- Define metadata with the Metadata API.
- Use framework navigation and link components appropriately.
- Avoid unnecessary client-side JavaScript and oversized dependencies.
