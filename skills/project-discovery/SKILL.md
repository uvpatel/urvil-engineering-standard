---
name: project-discovery
description: Inspect and understand an existing software repository before planning changes. Use at the start of a project, feature, debugging task, or unfamiliar codebase.
---

# Project Discovery

## Objective

Build an evidence-based map of the current repository without changing files.

## Procedure

1. Read `CLAUDE.md`, `AGENTS.md`, and relevant project instructions.
2. Inspect git status. Do not overwrite uncommitted work.
3. Inspect `package.json`, lockfiles, runtime versions, scripts, TypeScript config, and framework config.
4. Map routes, layouts, major components, server modules, state, schemas, data access, and tests.
5. Trace the relevant feature end-to-end: UI → request/action → validation → service → persistence → response.
6. Search for reusable components, utilities, hooks, types, and patterns.
7. Identify existing constraints, incomplete implementations, and risks.
8. Read only relevant files in depth; do not dump the entire repository.

## Output

Summarize:
- Stack and exact installed versions.
- Relevant directory map.
- Existing patterns worth preserving.
- Relevant files and responsibilities.
- Reusable code.
- Risks, gaps, and unknowns.

## Restrictions

- Read-only. Do not edit, install, generate, or delete files.
- Do not infer behavior from filenames alone.
- Distinguish observed facts from assumptions.
