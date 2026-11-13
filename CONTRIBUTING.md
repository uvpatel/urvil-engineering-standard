# Contributing to Urvil's Engineering Standards & Skills

Thank you for your interest in contributing to this repository. This project maintains Urvil Patel's personal engineering constitution, full-stack standards, and modular Agent Skills designed for the modern AI coding agent ecosystem.

## Core Philosophy

1. **AI Implements Approved Plans**: AI coding agents must never silently select or alter software architecture. Work follows the "Inspect → Plan → Approve → Implement → Verify" lifecycle.
2. **Modular & Focused**: Avoid monolithic files. Code is separated into cohesive, single-responsibility modules, components, services, and schemas.
3. **Evidence-Based Quality**: Optimizations and refactors must be supported by measurements and real requirements, not speculation.
4. **Independent Agent Skills**: Every skill under `skills/<skill-name>` must be independently installable and self-contained through the Skills CLI (`bunx skills add ... --skill <name>`). Skills must not have broken references to external repository files.

## Repository Structure

```text
.
├── skills/                     # Modular Agent Skills (Vercel Skills CLI compatible)
│   └── <skill-name>/
│       ├── SKILL.md            # Primary agent instruction file (YAML frontmatter + workflow)
│       └── references/         # Deep reference documentation loaded on demand
├── standards/                  # Enduring engineering standards and architectural principles
├── templates/                  # Reusable templates (plans, ADRs, checklists)
├── scripts/                    # Validation and offline installation tooling
├── AGENTS.md                   # Portable instructions for AI coding agents
├── CLAUDE.md                   # Claude Code repository constitution
├── LICENSE                     # MIT License
└── package.json                # Repository metadata and validation scripts
```

## Creating or Modifying a Skill

When creating or refining a skill:

1. **Directory Naming**: Use lowercase alphanumeric characters and hyphens matching the skill's purpose (e.g., `skills/nextjs-feature-engineering`).
2. **YAML Frontmatter**: The `SKILL.md` must start with valid YAML frontmatter:
   ```yaml
   ---
   name: <skill-name>
   description: <Actionable summary of capability>. Use when <explicit activation triggers>.
   license: MIT
   metadata:
     author: Urvil Patel
     version: 1.0.0
   ---
   ```
3. **Progressive Disclosure**:
   - Keep `SKILL.md` focused and concise (under 100 lines). Cover the core methodology, required checks, and developer approval gate.
   - Place detailed checklists, code patterns, and deep domain guides inside `references/<topic>.md`.
   - Link to reference files using standard relative markdown links (e.g., `[UI Patterns](references/ui-patterns.md)`).
4. **Self-Containment**: A skill must work independently. Never link to `../../standards/...` or `../../templates/...` from within a skill's `SKILL.md` or `references/`—bundle needed checklists directly inside the skill directory.
5. **Stack Fidelity**: Skills must reflect our standard production stack:
   - Next.js 16+ App Router, React 19+
   - TypeScript strict mode (no `any`, Discriminated Unions)
   - Tailwind CSS v4 & shadcn/ui
   - Better Auth for authentication
   - PostgreSQL/Drizzle or MongoDB/Mongoose
   - React Hook Form + Zod for forms and boundary validation
   - Tabler Icons (`@tabler/icons-react`)
   - Framer Motion for intentional animation (respecting `prefers-reduced-motion`)
   - Bun as the primary package manager and runtime

## Validation

Before committing changes, run the validation test suite using Bun:

```bash
bun run validate
```

The validation script verifies:
- All required repository files exist.
- Every skill has a valid `SKILL.md` with correct YAML frontmatter delimiters.
- Frontmatter `name` strictly matches its parent directory name.
- Frontmatter `description` contains an actionable "Use when..." activation condition.
- Every relative file link in markdown resolves to an existing file.

## Pull Request Guidelines

1. Ensure `bun run validate` passes with zero errors.
2. Maintain clean, atomic commits with descriptive commit messages following the Conventional Commits format (e.g., `feat(skills): add performance audit checklist`).
3. Update `CHANGELOG.md` when introducing new skills or breaking alterations to existing skills.
