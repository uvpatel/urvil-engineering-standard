# Repository Agent Instructions

This file is the portable entry point for AI coding agents. Claude Code should also read `CLAUDE.md`.

## Non-negotiable workflow

- Inspect the existing repository before proposing changes.
- For substantial features, refactors, migrations, and cross-cutting work, create a written implementation plan and wait for explicit developer approval.
- Do not edit application files before approval.
- After approval, implement only the approved scope. Re-plan if material assumptions change.
- Preserve existing uncommitted work and project conventions.
- Never claim tests or commands passed unless they were executed successfully.

## Engineering defaults

- Prefer modular, cohesive TypeScript and clear separation of responsibilities.
- Use Next.js App Router and React Server Components by default when the project uses Next.js.
- Keep client boundaries narrow and server-only code protected.
- Use the project's installed versions and conventions; do not assume the newest API exists.
- Reuse existing UI components, tokens, utilities, schemas, and services.
- Use Zod at trust boundaries where appropriate.
- Enforce authentication and authorization server-side.
- Optimize only with evidence; avoid premature abstractions and unnecessary dependencies.
- Use Tabler Icons (`@tabler/icons-react`) unless explicitly overridden.
- Prefer Bun and `bunx` for new projects and authored commands. Respect an existing lockfile/package manager; do not migrate without approval.

## Required plan contents

For substantial work, list:
- Requirements, assumptions, and open questions.
- Existing code and reusable modules inspected.
- Proposed architecture, data flow, and module responsibilities.
- Exact files to create, modify, or delete.
- API/data contracts and validation.
- Security, accessibility, performance, and error-state considerations.
- Dependencies and verification commands.
- Risks and rollback/compatibility concerns.

End by asking for approval. Wait.

## Code quality

- No monolithic components or files when responsibilities can be separated.
- No unnecessary abstractions, duplicated logic, placeholder functionality, or unexplained `any`.
- Keep route handlers and page entry points focused.
- Handle loading, empty, error, success, and unauthorized states.
- Keep secrets and privileged operations server-side.
- Preserve behavior unless a change is explicitly approved.

## Verification

Inspect `package.json` and run only available relevant scripts. Typical Bun commands are `bun run lint`, `bun run typecheck`, `bun run test`, and `bun run build`. Report exact results and anything not run.
