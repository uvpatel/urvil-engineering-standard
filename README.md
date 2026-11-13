* [ ] 

# Urvil's Engineering Standards

A personal engineering handbook and reusable Agent Skills library for Claude Code and other skills-compatible coding agents.

**Core principle:** AI implements the developer-approved plan. It does not silently choose or change the architecture.

## What this repository provides

- `CLAUDE.md`: Claude Code entry point.
- `AGENTS.md`: portable repository-level instructions for compatible agents.
- `standards/`: durable engineering rules and technology conventions.
- `skills/`: focused, progressive-disclosure Agent Skills.
- `templates/`: plans, feature specifications, reviews, and decisions.
- `scripts/`: validation and installation helpers.

This repository contains engineering guidance only. It does not scaffold or implement an application.

## Quick start

### 1. Clone with Bun-friendly tooling

```bash
git clone https://github.com/uvpatel/engineering-standards.git
cd engineering-standards
bun install
```

No runtime dependencies are required; `bun install` is optional unless dependencies are later added.

### 2. Install into a project

From the target project root:

```bash
bunx degit uvpatel/engineering-standards#main /tmp/urvil-engineering-standards
```

Review the source first, then copy the instructions and skills:

```bash
cp /tmp/urvil-engineering-standards/CLAUDE.md ./CLAUDE.md
cp /tmp/urvil-engineering-standards/AGENTS.md ./AGENTS.md
mkdir -p .claude/skills
cp -R /tmp/urvil-engineering-standards/skills/* .claude/skills/
```

If the target project already has `CLAUDE.md`, `AGENTS.md`, or skill folders, merge carefully instead of overwriting. Preserve project-specific rules and resolve conflicts explicitly.

### 3. Install official Vercel skills separately

These are upstream skills, not copies maintained by this repository. Check the upstream repository and available skill names before installing:

```bash
bunx skills add vercel-labs/agent-skills --skill vercel-react-best-practices
bunx skills add vercel-labs/agent-skills --skill vercel-composition-patterns
```

Use the skills CLI help to inspect supported flags and source repositories:

```bash
bunx skills --help
```

Install only skills that are relevant to the current project. Upstream skill names and repository locations can change.

## Repository layout

```text
.
├── AGENTS.md
├── CLAUDE.md
├── README.md
├── standards/
│   ├── architecture.md
│   ├── backend-and-api.md
│   ├── code-quality.md
│   ├── database.md
│   ├── frontend-and-ui.md
│   ├── naming-and-files.md
│   ├── nextjs.md
│   ├── performance.md
│   ├── security.md
│   ├── testing-and-verification.md
│   └── typescript.md
├── skills/
│   ├── project-discovery/SKILL.md
│   ├── implementation-planning/SKILL.md
│   ├── nextjs-feature-engineering/SKILL.md
│   ├── modular-refactoring/SKILL.md
│   ├── frontend-ui-engineering/SKILL.md
│   ├── backend-api-engineering/SKILL.md
│   ├── database-modeling/SKILL.md
│   ├── authentication-engineering/SKILL.md
│   ├── ai-feature-engineering/SKILL.md
│   ├── performance-audit/SKILL.md
│   └── code-review/SKILL.md
├── templates/
│   ├── architecture-decision-record.md
│   ├── code-review-checklist.md
│   ├── feature-spec.md
│   └── implementation-plan.md
└── scripts/
    ├── install-claude-skills.sh
    └── validate.sh
```

## How to use

1. Add `CLAUDE.md` and `.claude/skills/` to a project.
2. Ask the agent to inspect the repository and identify applicable standards.
3. Ask for a plan. The agent must stop and wait for approval before implementation.
4. Approve, amend, or reject the plan.
5. Implement in small, reviewable increments.
6. Require verification and an honest completion report.

## Customization

Edit standards to reflect deliberate decisions. Keep global preferences here; keep application-specific architecture, scripts, and exceptions in the target project's own instructions.

## Bun policy

Use Bun commands in new project instructions and examples:

- `bun install`
- `bun add <package>`
- `bun add -d <package>`
- `bun remove <package>`
- `bun run <script>`
- `bunx <tool>`

Do not migrate an existing project from another package manager without explicit approval. Respect its lockfile and runtime constraints.

## License

Use, modify, and adapt these standards for your own projects.
# urvil-engineering-standard
