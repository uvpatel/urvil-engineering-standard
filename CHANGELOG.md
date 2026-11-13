# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-11-13

### Added
- Official compatibility with the Vercel Skills CLI (`bunx skills` / `npx skills`) and `skills.sh` ecosystem.
- Standalone installation support for individual skills using `bunx skills add uvpatel/engineering-standards --skill <skill-name>`.
- Progressive disclosure architecture for all 11 core Agent Skills:
  - `project-discovery`: Read-only codebase inspection and discovery checklist.
  - `implementation-planning`: Mandatory developer approval gate with self-contained plan template.
  - `nextjs-feature-engineering`: Next.js 16+ App Router, React 19, RSC-first conventions.
  - `modular-refactoring`: Cohesion and file-size guardrails with modular decomposition patterns.
  - `frontend-ui-engineering`: shadcn/ui, Tailwind CSS v4, Tabler Icons, and accessible UI patterns.
  - `backend-api-engineering`: Zod boundary validation, Route Handlers, Server Actions, and security patterns.
  - `database-modeling`: PostgreSQL (Drizzle ORM) and MongoDB (Mongoose ODM) schemas and query hygiene.
  - `authentication-engineering`: Better Auth server-side enforcement and authorization patterns.
  - `ai-feature-engineering`: Structured outputs, tool calling, RAG pipelines, and security controls.
  - `performance-audit`: Evidence-based Core Web Vitals, RSC payload, and query optimization checklists.
  - `code-review`: Severity-ordered review methodology and self-contained inspection checklist.
- Companion reference directories (`skills/*/references/`) ensuring 100% independent reusability without broken external dependencies.
- Standard MIT `LICENSE`.
- Repository `CONTRIBUTING.md` guidelines.
- Enhanced validation test suite (`scripts/validate.sh`) enforcing directory matching, frontmatter triggers, and reference link resolution.
- Updated Bun-first offline skill installation script (`scripts/install-claude-skills.sh`).
