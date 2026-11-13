# Backend and API Standards

- Keep transport/request handling separate from domain logic when complexity warrants it.
- Keep route handlers thin: parse request, authenticate/authorize, validate, invoke use case, map response.
- Validate params, query strings, headers, and bodies at trust boundaries with Zod or an equivalent approved validator.
- Return consistent response shapes and appropriate HTTP status codes.
- Do not expose internal exception messages, stack traces, secrets, or database internals.
- Use explicit timeouts, retries, and idempotency where external calls or duplicate submissions require them.
- Avoid N+1 queries and unbounded list endpoints.
- Add pagination, filtering, sorting, and field selection intentionally.
- Use transactions for multi-step writes that must be atomic.
- Enforce authorization for every protected operation, not only in the UI.
- Log useful operational context while excluding tokens, passwords, and sensitive personal data.
- Use Server Actions only for suitable application mutations; use Route Handlers for public APIs, webhooks, and integrations where appropriate.
