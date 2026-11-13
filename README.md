# Urvil's Engineering Standards & Agent Skills

> A production-grade engineering constitution and reusable Agent Skills library for Next.js, React, and full-stack TypeScript development, distributed via the open [Skills Ecosystem](https://skills.sh).

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills CLI](https://img.shields.io/badge/Skills%20CLI-Compatible-success)](https://skills.sh)
[![Next.js 16+](https://img.shields.io/badge/Next.js-16%2B%20App%20Router-black)](https://nextjs.org)
[![React 19](https://img.shields.io/badge/React-19-blue)](https://react.dev)
[![Bun](https://img.shields.io/badge/Runtime-Bun-f472b6)](https://bun.sh)

---

## Core Philosophy

1. **AI Implements the Approved Plan:** AI coding agents must never act as autonomous product architects or silently alter software architecture. Work follows the strict **Inspect → Plan → Approve → Implement → Verify** lifecycle.
2. **Server-First Architecture:** React Server Components (RSC) by default. Client boundaries (`"use client"`) are narrow and confined to interactive leaves. Secrets and database queries never leak into client bundles.
3. **Small, Cohesive Modules:** No monolithic 500-line components. Logic is decomposed into single-responsibility UI primitives, custom hooks, Zod validation schemas, and domain services.
4. **Independent Reusability:** Every skill is fully self-contained. You can install the entire library or just a single focused skill into your project without carrying broken references or unneeded overhead.

---

## Quick Start with Skills CLI

Install and wire skills directly into your coding agents using the official [Skills CLI](https://skills.sh):

### 1. Interactive Multi-Skill Installation
Browse and select any combination of skills for your project:

```bash
bunx skills add uvpatel/engineering-standards
```

### 2. Install Individual Skills
Install only the specific capabilities your current project needs:

```bash
# Next.js 16+ App Router engineering
bunx skills add uvpatel/engineering-standards --skill nextjs-feature-engineering

# Architecture planning with mandatory developer approval gate
bunx skills add uvpatel/engineering-standards --skill implementation-planning

# Monolithic component refactoring & decomposition
bunx skills add uvpatel/engineering-standards --skill modular-refactoring

# Accessible UI with shadcn/ui, Tailwind v4, & Tabler Icons
bunx skills add uvpatel/engineering-standards --skill frontend-ui-engineering

# Better Auth integration & session security
bunx skills add uvpatel/engineering-standards --skill authentication-engineering
```

### 3. Target a Specific Coding Agent
By default, the CLI installs skills for all detected agents. You can target a specific agent using the `-a` flag:

```bash
# Target Claude Code (.claude/skills/)
bunx skills add uvpatel/engineering-standards --skill nextjs-feature-engineering -a claude-code

# Target Cursor (.cursor/skills/ or rules)
bunx skills add uvpatel/engineering-standards --skill nextjs-feature-engineering -a cursor
```

### 4. Global Installation
Make skills available across all local repositories on your machine:

```bash
bunx skills add uvpatel/engineering-standards -g
```

---

## Supported Coding Agents

These skills follow the open [Agent Skills Specification](https://agentskills.io) and are compatible with:

| Agent | Global Flag (`-g`) | Target Identifier (`-a`) | Default Skill Location |
|---|:---:|:---:|---|
| **Claude Code** | Yes | `claude-code` | `.claude/skills/<skill-name>/` |
| **Cursor** | Yes | `cursor` | `.cursor/skills/` |
| **GitHub Copilot** | Yes | `github-copilot` | `.github/skills/` |
| **Cline** | Yes | `cline` | `.cline/skills/` |
| **Windsurf** | Yes | `windsurf` | `.windsurf/skills/` |
| **OpenCode** | Yes | `opencode` | `.opencode/skills/` |
| **Codex** | Yes | `codex` | `.codex/skills/` |

---

## Skills Catalog

| Skill | Activation Trigger ("Use when...") | Install Command |
|---|---|---|
| [`project-discovery`](skills/project-discovery/SKILL.md) | Inspecting and mapping an existing codebase without changing files. | `bunx skills add uvpatel/engineering-standards --skill project-discovery` |
| [`implementation-planning`](skills/implementation-planning/SKILL.md) | Preparing substantial architectural changes, features, or refactors. Mandatory approval gate. | `bunx skills add uvpatel/engineering-standards --skill implementation-planning` |
| [`nextjs-feature-engineering`](skills/nextjs-feature-engineering/SKILL.md) | Building pages, server components, server actions, route handlers in Next.js 16+ App Router. | `bunx skills add uvpatel/engineering-standards --skill nextjs-feature-engineering` |
| [`modular-refactoring`](skills/modular-refactoring/SKILL.md) | Decomposing monolithic files (>300–500 lines) into cohesive modules while preserving behavior. | `bunx skills add uvpatel/engineering-standards --skill modular-refactoring` |
| [`frontend-ui-engineering`](skills/frontend-ui-engineering/SKILL.md) | Building accessible, responsive UI with shadcn/ui, Tailwind CSS v4, Tabler Icons, & RHF. | `bunx skills add uvpatel/engineering-standards --skill frontend-ui-engineering` |
| [`backend-api-engineering`](skills/backend-api-engineering/SKILL.md) | Creating secure Route Handlers, Server Actions, Zod boundary validation, and domain services. | `bunx skills add uvpatel/engineering-standards --skill backend-api-engineering` |
| [`database-modeling`](skills/database-modeling/SKILL.md) | Modeling, indexing, and migrating PostgreSQL (Drizzle ORM) or MongoDB (Mongoose ODM). | `bunx skills add uvpatel/engineering-standards --skill database-modeling` |
| [`authentication-engineering`](skills/authentication-engineering/SKILL.md) | Implementing or reviewing authentication, authorization, and session checks with Better Auth. | `bunx skills add uvpatel/engineering-standards --skill authentication-engineering` |
| [`ai-feature-engineering`](skills/ai-feature-engineering/SKILL.md) | Implementing LLM chat, Zod structured outputs, safe tool calling, RAG, and evaluations. | `bunx skills add uvpatel/engineering-standards --skill ai-feature-engineering` |
| [`performance-audit`](skills/performance-audit/SKILL.md) | Diagnosing Core Web Vitals (LCP, INP, CLS), bundle bloat, waterfalls, or query latency. | `bunx skills add uvpatel/engineering-standards --skill performance-audit` |
| [`code-review`](skills/code-review/SKILL.md) | Conducting thorough code reviews prioritized by severity (Critical → High → Medium → Low). | `bunx skills add uvpatel/engineering-standards --skill code-review` |

---

## Technology Stack & Engineering Defaults

Every skill in this repository enforces these engineering standards:

* **Framework:** Next.js 16+ App Router, React 19+
* **Language:** TypeScript in strict mode (no casual `any`, discriminated unions for state)
* **Styling:** Tailwind CSS v4 (CSS-first `@theme` configuration)
* **UI Components:** shadcn/ui design primitives with token discipline
* **Icons:** Tabler Icons via `@tabler/icons-react`
* **Authentication:** Better Auth (server-enforced sessions and role-based permissions)
* **Persistence:** PostgreSQL with Drizzle ORM or MongoDB with Mongoose ODM
* **Forms & Validation:** React Hook Form with Zod boundary schema resolvers
* **Animation:** Framer Motion (only when justified, respecting `prefers-reduced-motion`)
* **Client State:** Zustand (used strictly for shared state across disconnected components)
* **Runtime & Package Manager:** Bun (`bun`, `bunx`) for all authored commands

---

## Progressive Disclosure Architecture

Each skill uses a two-tier progressive disclosure model to optimize the agent's context window:

1. **Lightweight Skill Entry (`SKILL.md`):** Loaded into context when triggered. Contains non-negotiable rules, workflow steps, and the developer approval gate (~40–80 lines).
2. **Deep Domain References (`references/*.md`):** Traversed and read on-demand by the agent only when detailed implementation patterns, schemas, or checklists are needed.

```text
skills/nextjs-feature-engineering/
├── SKILL.md                          # Primary agent workflow & activation conditions
└── references/
    └── nextjs-patterns.md            # Deep patterns: async params, Server Actions, error boundaries
```

---

## Alternative: Offline / Manual Installation

If you are working offline or without the Skills CLI, use the bundled installation script to copy skills directly into your repository:

```bash
# From this repository root, targeting an existing project:
bash scripts/install-claude-skills.sh /path/to/target-project
```

This installs:
- All 11 self-contained skills into `/path/to/target-project/.claude/skills/`
- `CLAUDE.md` and `AGENTS.md` project constitutions if not already present

---

## Repository Structure

```text
.
├── skills/                     # 11 independently installable Agent Skills
│   ├── ai-feature-engineering/
│   ├── authentication-engineering/
│   ├── backend-api-engineering/
│   ├── code-review/
│   ├── database-modeling/
│   ├── frontend-ui-engineering/
│   ├── implementation-planning/
│   ├── modular-refactoring/
│   ├── nextjs-feature-engineering/
│   ├── performance-audit/
│   └── project-discovery/
├── standards/                  # Global engineering constitution and topic guidelines
├── templates/                  # Implementation plans, ADRs, and specs
├── scripts/                    # Validation test suite & offline install script
├── AGENTS.md                   # Portable instructions for AI coding agents
├── CLAUDE.md                   # Claude Code instructions
├── CONTRIBUTING.md             # Contribution guidelines
├── CHANGELOG.md                # Release notes
└── LICENSE                     # MIT License
```

---

## Validation

Verify that all skills and reference files conform to the Agent Skills specification:

```bash
bash scripts/validate.sh
```

---

## License

MIT © [Urvil Patel](LICENSE)
