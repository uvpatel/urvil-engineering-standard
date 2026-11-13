---
name: authentication-engineering
description: Implement, configure, and review authentication, authorization, and session management using Better Auth. Use when configuring auth providers, protecting routes, checking user permissions, or managing sessions.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Authentication Engineering

## Preserve Better Auth

Better Auth is the project's standard authentication framework. Do not replace it with Clerk, Auth.js (NextAuth), or custom token implementations without explicit developer approval.

## Security Architecture

1. **Server Enforcement:** Enforce authentication (`auth.api.getSession`) and authorization (roles, permissions) on the server in Server Components, Server Actions, and Route Handlers. Client-side route guards are insufficient.
2. **Secret Isolation:** Keep `BETTER_AUTH_SECRET`, OAuth client secrets, and database credentials in server-side environment variables. Never expose them via `NEXT_PUBLIC_`.
3. **Session Cookies:** Ensure session cookies are configured with `HttpOnly`, `SameSite=Lax`, and `Secure` in production.
4. **Anti-IDOR:** Use the authenticated session user ID to query and mutate resources. Never trust an unverified user ID supplied in request bodies.

## UX & Auth States

Ensure complete coverage across the entire authentication lifecycle:
- Login and Signup flows with client & server validation.
- OAuth callbacks, loading states, and redirect handlers.
- Session expiration and graceful re-authentication.
- Unauthorized access feedback (`401` / `403` redirects or messages).
- Clear, safe sign-out behavior.

## Reference Patterns

For detailed Better Auth server helper examples, Server Action protection, and client hooks, consult [Better Auth Engineering Patterns](references/better-auth-patterns.md).
