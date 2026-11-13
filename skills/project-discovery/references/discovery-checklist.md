# Project Discovery Checklist

Use this checklist during the read-only exploration phase before drafting an implementation plan.

## 1. Environment & Runtime Inspection
- [ ] Inspect package manager and lockfile (`bun.lockb`, `bun.lock`, `pnpm-lock.yaml`, `package-lock.json`).
- [ ] Read `package.json`:
  - Framework versions (Next.js 16+, React 19+, etc.)
  - Installed libraries (Tailwind v4, shadcn/ui, Better Auth, Drizzle, Mongoose, Zod, Tabler Icons)
  - Existing scripts (`lint`, `typecheck`, `test`, `build`)
- [ ] Inspect TypeScript configuration (`tsconfig.json`, `strict: true`, path aliases).
- [ ] Check framework configuration (`next.config.ts`, `tailwind.config.ts`, `components.json`).
- [ ] Check git status to ensure you do not overwrite uncommitted work.

## 2. Architecture & File Mapping
- [ ] Trace routing layout (`src/app/` or `app/`):
  - Root layouts, nested layouts, loading, and error boundaries.
  - Route handlers (`app/api/**/route.ts`) and server action files.
- [ ] Map component organization:
  - Primitive UI components (`components/ui/`)
  - Feature-specific components (`components/<domain>/` or `features/<domain>/components/`)
- [ ] Map backend, domain, and data layers:
  - Database client and schema definitions (`db/`, `server/db/`, `models/`)
  - Domain services, validation schemas (`lib/schemas/`, `lib/validations/`)
  - Authentication helpers and session checks (`lib/auth.ts`, `auth.ts`)

## 3. End-to-End Flow Tracing
Trace a representative request through the layers:
1. **User interaction:** Client component or page form.
2. **Transport boundary:** Server Action or Route Handler.
3. **Input validation:** Zod schema validation.
4. **Authorization check:** Server-side session and permission verification.
5. **Business logic:** Service or domain function call.
6. **Data persistence:** ORM/ODM query with explicit projections.
7. **Response & UI state:** Typed return value, error handling, revalidation.

## 4. Discovery Report Template
When presenting discovery findings to the developer, summarize:
- **Stack & Versions:** Observed runtime, framework, and dependencies.
- **Relevant Routes & Modules:** Files directly affected by the requested task.
- **Reusable Code:** Existing components, utilities, and schemas to leverage.
- **Patterns & Conventions:** Naming conventions, error handling, state management patterns.
- **Constraints & Risks:** Missing types, technical debt, potential breaking changes.
