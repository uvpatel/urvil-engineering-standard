---
name: backend-api-engineering
description: Design and implement secure, validated backend endpoints, server actions, and business services in an existing TypeScript application.
---

# Backend and API Engineering

## Plan first

For substantial endpoints or backend changes, map the current request-to-database flow and obtain plan approval.

## Layer responsibilities

- Transport layer: parse request, authenticate, authorize, validate, invoke service, map response.
- Validation: Zod schemas at untrusted boundaries.
- Service/use-case layer: business rules and orchestration.
- Repository/data layer: persistence queries when separation is useful.
- Types/DTOs: explicit contracts; do not expose raw database documents.

## Security

- Authenticate and authorize on the server.
- Verify resource ownership/tenant scope.
- Validate body, params, and query values.
- Avoid leaking internal errors.
- Protect webhooks with signature verification and idempotency where applicable.
- Keep secrets server-side.

## Reliability

- Use correct status codes and consistent error contracts.
- Bound queries and paginate lists.
- Handle duplicate requests and race conditions.
- Add timeouts and safe retry behavior for external services.

## Verify

Test success, validation failure, unauthenticated, unauthorized, not-found, conflict, and dependency failure paths as relevant.
