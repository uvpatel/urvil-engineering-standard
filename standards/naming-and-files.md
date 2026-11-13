# Naming and File Organization

## Naming

| Item | Convention | Example |
|---|---|---|
| React components | PascalCase | `UserProfile.tsx` |
| Component files | PascalCase | `DashboardHeader.tsx` |
| Hooks | camelCase with `use` | `useDebouncedValue.ts` |
| Utilities | camelCase | `formatCurrency.ts` |
| Constants | UPPER_SNAKE_CASE | `DEFAULT_PAGE_SIZE` |
| Types/interfaces | PascalCase | `UserProfile` |
| Zod schemas | descriptive camelCase | `createUserSchema.ts` |
| Route handlers | Next.js convention | `route.ts` |
| Tests | target + suffix | `user-service.test.ts` |
| CSS modules | component name | `Dashboard.module.css` |

Follow established project conventions if they differ.

## File size and cohesion

- Prefer focused modules, commonly around 100–200 lines where practical.
- Review files above roughly 250 lines for multiple responsibilities.
- These are review signals, not hard limits. A cohesive 260-line file may be better than six artificial fragments.
- Split when a component contains separable sections, complex state orchestration, data access, validation, or reusable behavior.
- Do not split a simple component into one-file-per-element.
- Keep one primary exported component per component file unless a small tightly coupled helper makes co-location clearer.

## Imports and exports

- Use the project's configured aliases (commonly `@/`).
- Group imports consistently: framework/external, internal aliases, relative, styles/assets.
- Avoid deep import paths where a stable module entry point is available.
- Do not add `index.ts` barrels by default. Avoid barrels that create cycles or hide dependencies.
- Use named exports by default for ordinary modules; follow framework-required default exports for route/page conventions.

## File creation discipline

Before adding a file, search for an existing module that already owns the responsibility. Do not create `helpers.ts`, `utils.ts`, or `common.ts` as vague catch-alls. Name files by the capability they provide.
