---
name: backend-api-engineering
description: Design and implement secure, validated backend endpoints, Server Actions, Route Handlers, and business services in TypeScript. Use when creating or updating API routes, server actions, webhooks, or input validation schemas.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Backend and API Engineering

## Layered Responsibilities

Maintain clean separation between transport, validation, business rules, and persistence:
- **Transport Layer:** Thin Next.js Route Handlers (`app/api/**/route.ts`) and Server Actions.
- **Validation Boundary:** Strict Zod schema validation on all inputs (params, query, body, headers).
- **Service Layer:** Business rules, workflow orchestration, and domain calculations.
- **Data Layer:** Typed DTOs and queries via Drizzle ORM or Mongoose ODM. Never leak raw database documents to clients.

## Security & Reliability Guardrails

1. **Server-Side Authentication:** Enforce Better Auth session checks server-side for all protected endpoints. Never rely on client-side route guards.
2. **Anti-IDOR:** Validate resource ownership and tenant isolation using the authenticated session user ID, never trusting client-supplied IDs.
3. **Information Hiding:** Never return internal stack traces, database identifiers, or secrets in API responses.
4. **Idempotency & Webhooks:** Verify cryptographic webhook signatures and handle duplicate deliveries with idempotency keys.
5. **Bounded Queries:** Always apply pagination and explicit field projections on list endpoints.

## Procedure

1. **Plan First:** Map request flow, DTO shapes, and validation rules. Obtain approval for new APIs or breaking changes.
2. **Define Validation:** Create Zod schemas for all request payloads.
3. **Implement Service:** Implement domain logic with explicit error handling.
4. **Wire Transport:** Connect Route Handler or Server Action, returning proper HTTP status codes.
5. **Verify:** Test success paths, validation failures (422), unauthenticated calls (401), and unauthorized access (403).

## Reference Patterns

For detailed request flows, anti-IDOR patterns, and HTTP status codes, consult [Backend API Patterns](references/api-patterns.md).
