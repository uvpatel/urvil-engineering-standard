# Implementation Plan Template

Use this template to create an implementation plan for substantial features, refactors, migrations, or cross-cutting changes. 

**Remember:** Stop and obtain explicit developer approval before modifying any application files.

---

```markdown
# Implementation Plan: [Feature or Change Name]

## 1. Goal & Requirements
- **Primary Goal:** [Brief description of the intended outcome]
- **Observable Acceptance Criteria:**
  - [ ] [Requirement 1]
  - [ ] [Requirement 2]
  - [ ] [Requirement 3]

## 2. Current-State Findings (Discovery)
- **Observed Stack & Versions:** [Next.js version, React version, ORM/DB, etc.]
- **Existing Code to Reuse:** [Components, hooks, utilities, schemas, services]
- **Relevant Routes & Modules:** [Files inspected during discovery]

## 3. Assumptions & Open Questions
- **Assumptions:** [Key technical or business assumptions]
- **Blocking Questions:** [Clarifications needed from the developer, if any]

## 4. Proposed Architecture & Module Boundaries
- [Explain the proposed approach and why it is the simplest cohesive solution]
- [Describe separation of responsibilities: presentation, orchestration, domain, data]

## 5. Data Flow & Contracts
- **Data Flow:** [UI Interaction → Route/Action → Zod Validation → Service → DB → Response]
- **Input Validation:** [Zod schema structure]
- **Response Shape:** [Typed DTOs, avoiding raw database leaks]

## 6. File-Level Change List

| Action | Path | Responsibility / Justification |
|---|---|---|
| Create | `src/features/example/components/feature-card.tsx` | Cohesive presentation component |
| Create | `src/features/example/schemas/feature.schema.ts` | Zod validation boundary |
| Create | `src/features/example/services/feature.service.ts` | Core business logic & db access |
| Update | `src/app/(dashboard)/example/page.tsx` | Route composition & server data fetching |
| Delete | `src/components/legacy-example.tsx` | Obsolete monolithic component |

## 7. UX, Edge Cases & Error States
- **Loading State:** [Skeleton component, Suspense boundary, or streaming indicator]
- **Empty State:** [Helpful empty state with call to action]
- **Error State:** [Inline validation error, error boundary, or toast message]
- **Success State:** [Feedback, optimistic update, or redirect]
- **Unauthorized / Not Found:** [Server-side redirect or 404/403 page]
- **Accessibility & Responsive:** [Keyboard navigation, ARIA labels, mobile breakpoints]

## 8. Security & Performance Considerations
- **Security:** [Server-side session validation, role checks, input sanitization]
- **Performance:** [Server Components by default, parallel data fetching, indexes, bounded queries]

## 9. Dependencies & Packages
- **Existing Packages Reused:** [shadcn/ui, Better Auth, Drizzle, etc.]
- **New Dependencies Proposed:** [None, or explicit package with justification]

## 10. Verification Plan
Commands that actually exist in the project:
- [ ] Type check: `bun run typecheck`
- [ ] Lint: `bun run lint`
- [ ] Tests: `bun run test`
- [ ] Build: `bun run build`
- [ ] Manual / E2E verification: [Specific user flows to test]

## 11. Risks & Rollback Strategy
- [Breaking change potential, database migration safety, fallback steps]

---

### Approval Gate
**Status:** Pending developer approval.

> "Please approve this implementation plan or specify requested changes. I will not edit application files until you approve."
```
