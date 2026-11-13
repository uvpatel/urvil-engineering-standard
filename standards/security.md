# Security Standards

- Treat all client input, query parameters, uploaded files, webhook payloads, and external API responses as untrusted.
- Validate and normalize input server-side.
- Authenticate and authorize every protected operation on the server.
- Apply least privilege to database credentials, OAuth scopes, and service tokens.
- Keep secrets in environment variables or approved secret stores; never commit them or expose them through `NEXT_PUBLIC_`.
- Check ownership/tenant access at the data operation boundary to prevent IDOR.
- Protect against injection by using parameterized database APIs and safe output handling.
- Verify webhook signatures and implement replay/idempotency protections where relevant.
- Apply upload size/type/content restrictions and safe storage policies.
- Avoid leaking sensitive data in errors, logs, analytics, URLs, or client payloads.
- Use secure cookie/session settings appropriate to deployment.
- Do not invent security guarantees. Flag unresolved risks and request approval for material trade-offs.
- Review dependency additions and avoid unmaintained or unnecessary packages.
