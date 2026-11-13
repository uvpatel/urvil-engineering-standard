---
name: project-discovery
description: Inspect and understand an existing codebase before planning or implementing changes. Use when starting a new project, exploring an unfamiliar codebase, investigating an issue, or performing architectural discovery.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Project Discovery

## Objective

Build an evidence-based map of the current repository without modifying any application files.

## Non-Negotiable Rules

1. **Read-Only Mode:** Do not edit, create, install, or delete any project files during discovery.
2. **Preserve Work:** Check `git status` first to avoid disturbing uncommitted developer work.
3. **Evidence Over Inference:** Ground all findings in actual code and configuration rather than assumptions or memory.

## Procedure

1. **Inspect Project Instructions:** Read `CLAUDE.md`, `AGENTS.md`, and `README.md` if present in the repository root.
2. **Environment & Tooling:** Inspect lockfiles (`bun.lockb`, `bun.lock`, etc.), `package.json`, runtime versions, and scripts. Prefer Bun for authored commands.
3. **Architecture Mapping:** Identify framework conventions (Next.js App Router, routing layouts, API routes, middleware).
4. **Data & Auth Flow:** Trace how requests flow: UI → transport (Route Handler/Server Action) → Zod validation → service layer → persistence (PostgreSQL/Drizzle or MongoDB/Mongoose) with Better Auth session checks.
5. **Reusable Assets:** Locate existing primitives in `components/ui/` (shadcn/ui), hooks, utilities, and schemas before proposing new ones.
6. **Identify Gaps:** Note missing types, unhandled errors, technical debt, or potential migration risks.

## Detailed Checklist

For a structured step-by-step discovery checklist and report template, consult [Discovery Checklist](references/discovery-checklist.md).

## Output Format

Present discovery findings to the developer:
- **Stack & Versions:** Exact observed runtimes and libraries.
- **Relevant Directories & Files:** Modules impacted by the task.
- **Existing Reusable Assets:** Components and services to leverage.
- **Constraints & Risks:** Blockers, edge cases, or open questions.
