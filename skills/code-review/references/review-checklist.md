# Code Review Inspection Checklist

Use this checklist when conducting thorough code reviews against Urvil's Engineering Standards.

---

## 1. Severity Levels & Categorization

Order findings strictly by severity:

- **Critical:** Security vulnerabilities (auth bypass, IDOR, SQL/NoSQL injection, secret leaks), data loss, broken core user flows.
- **High:** Correctness bugs, race conditions, request waterfalls, missing server-side validation, severe accessibility violations.
- **Medium:** Module cohesion issues, unnecessarily large files (>300-500 lines), missing loading/error UI states, improper error handling.
- **Low:** Minor naming inconsistencies, non-blocking cleanup, documentation suggestions.

---

## 2. Review Checklist

### A. Correctness & Plan Fidelity
- [ ] Conforms strictly to the approved implementation plan.
- [ ] Does not silently introduce unapproved architectural changes or new dependencies.
- [ ] Handles boundary conditions, empty data sets, and unexpected inputs.

### B. Architecture & Modularity
- [ ] Files and components are small, focused, and cohesive.
- [ ] No monolithic 500-line components; responsibilities are cleanly separated (UI, service, validation, schemas).
- [ ] No arbitrary catch-all `utils.ts` or `helpers.ts` dumping grounds.

### C. Next.js 16+ & React 19 Standards
- [ ] Server Components are used by default; `"use client"` is confined to leaf components.
- [ ] Data fetching occurs server-side without request waterfalls (`Promise.all` used for independent reads).
- [ ] In Next.js 16+, `params` and `searchParams` are correctly awaited.
- [ ] Route-level boundaries (`loading.tsx`, `error.tsx`, `not-found.tsx`) are implemented where appropriate.

### D. Security & Data Integrity
- [ ] Authentication and authorization are validated on the server for all protected routes and actions.
- [ ] External inputs (body, query, params) are validated using Zod at the transport boundary.
- [ ] No secrets, private keys, or internal stack traces are exposed to client bundles or API responses.
- [ ] Database queries use explicit projections and bounded pagination.

### E. Frontend UI & Accessibility
- [ ] Reuses existing `components/ui/` (shadcn/ui) and project design tokens.
- [ ] Uses `@tabler/icons-react` for icons unless explicitly overridden.
- [ ] Form handling uses React Hook Form with Zod schema resolvers.
- [ ] All mandatory UI states are present: Loading, Empty, Error, Success, Disabled.
- [ ] Accessible keyboard focus, labels, semantic HTML, and `prefers-reduced-motion` support.

### F. Verification
- [ ] `bun run lint` passes without suppressed warnings.
- [ ] `bun run typecheck` passes with zero TypeScript errors and no unjustified `any`.
- [ ] `bun run test` passes without broken unit or integration tests.
