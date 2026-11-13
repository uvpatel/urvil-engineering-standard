# Architecture Standards

## Principles

- Start with the simplest architecture that cleanly satisfies current requirements.
- Organize by responsibility and domain; avoid both a single giant `components/` dump and premature enterprise layering.
- Separate presentation, application orchestration, domain rules, and infrastructure when complexity justifies it.
- Keep dependency direction explicit. UI should not own persistence details; domain rules should not depend on framework request objects.
- Prefer stable, explicit module interfaces over deep relative imports and hidden side effects.
- Avoid circular dependencies and broad catch-all utility modules.

## Next.js starting layout

Adapt to the actual product; do not force every folder into every project.

```text
src/
├── app/                    # routes, layouts, route-level boundaries
├── components/
│   ├── ui/                 # shared primitives/design-system components
│   ├── layout/             # navigation, shell, footer
│   └── shared/             # genuinely cross-feature UI
├── features/               # optional: domain-oriented feature modules
├── hooks/                  # shared hooks only
├── lib/
│   ├── utils/
│   ├── validations/
│   └── constants/
├── server/
│   ├── auth/
│   ├── db/
│   └── services/
├── states/                 # shared client state only
├── types/
└── config/
```

Feature modules may contain `components/`, `hooks/`, `schemas/`, `services/`, `types/`, and `utils/` when those files belong to that feature. Do not create empty folders.

## Boundaries

- `app/` composes route-level UI and exports framework conventions.
- `components/ui/` contains primitives, not application business logic.
- Feature modules own feature-specific UI and orchestration.
- `server/` contains server-only infrastructure and privileged logic.
- `lib/` contains broadly reusable, framework-light helpers—not a dumping ground.
- `states/` contains shared client state, not server cache or every form field.

## Decisions

Record consequential decisions in an ADR using `templates/architecture-decision-record.md`. Do not introduce a new architectural pattern silently.
