---
name: authentication-engineering
description: Implement or review authentication and authorization using the project's approved Better Auth configuration and data model.
---

# Authentication Engineering

## Preserve the selected provider

Use Better Auth when it is the approved project choice. Do not replace it with Clerk, Auth.js, or a custom solution without explicit approval.

## Design

- Inspect current auth configuration, adapters, providers, session strategy, callbacks, and route protection.
- Distinguish authentication (who the user is) from authorization (what they may do).
- Enforce protected operations on the server; UI route guards are not sufficient.
- Define session lifetime, cookie settings, account linking, and sign-out behavior.
- Validate callback URLs and OAuth configuration.
- Keep secrets in environment variables.
- Avoid exposing provider tokens or session internals to the client.

## UX

Cover login, signup, callback/loading, validation errors, expired sessions, unauthorized access, and logout.

## Verification

Test unauthenticated access, authenticated access, ownership checks, expired/invalid sessions, provider failure, and account-linking edge cases where applicable.
