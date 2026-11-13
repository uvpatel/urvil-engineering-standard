# Code Review Checklist

## Correctness
- [ ] Meets approved acceptance criteria.
- [ ] Handles expected edge cases and failure paths.
- [ ] No unrelated behavior changed.

## Architecture and maintainability
- [ ] Responsibilities are cohesive.
- [ ] No unnecessary duplication or abstraction.
- [ ] Existing patterns and module boundaries are respected.
- [ ] Types and contracts are explicit.

## Next.js / React
- [ ] Server/client boundary is justified.
- [ ] Data fetching avoids unnecessary waterfalls/duplication.
- [ ] Loading/error/not-found states are handled.
- [ ] Caching behavior is intentional.

## Security and data
- [ ] Inputs validated server-side.
- [ ] Authentication and authorization enforced server-side.
- [ ] No secrets or sensitive fields exposed.
- [ ] Queries are bounded and appropriate.

## UI and accessibility
- [ ] Responsive at supported breakpoints.
- [ ] Keyboard and focus behavior works.
- [ ] Semantic markup and accessible names are present.
- [ ] Reduced-motion preference is respected.

## Verification
- [ ] Lint/typecheck/tests run as appropriate.
- [ ] Build run when practical.
- [ ] Final diff reviewed.
- [ ] Results reported accurately.
