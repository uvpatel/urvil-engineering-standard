# Frontend and UI Standards

## Design-system discipline

- Inspect existing tokens, typography, spacing, colors, components, and interaction patterns first.
- Reuse installed shadcn/ui components; extend them consistently instead of duplicating primitives.
- Tailwind CSS v4 syntax must match the installed v4 setup. Do not paste v3 configuration patterns into v4 projects.
- Use Tabler Icons via `@tabler/icons-react` by default.
- Use Framer Motion only for purposeful motion and when compatible with the project.
- Do not introduce a new UI library without approval.

## Component design

- Separate reusable primitives from feature-specific composition.
- Keep data fetching and privileged logic out of presentational components.
- Prefer explicit, typed props and composition.
- Avoid components with too many unrelated responsibilities.
- Support responsive layouts and content growth.
- Use semantic HTML before custom interactive elements.

## States

For interactive features, consider:
- Initial/loading state.
- Empty state.
- Success state.
- Validation and server error states.
- Disabled/submitting state.
- Unauthorized/not-found state where relevant.
- Offline/retry state when the feature depends on network availability.

## Accessibility

- Use labels and accessible names for controls.
- Preserve keyboard navigation and visible focus.
- Use correct heading hierarchy and landmarks.
- Provide text alternatives for meaningful images.
- Do not communicate status through color alone.
- Respect `prefers-reduced-motion`.
- Ensure dialogs, menus, and popovers follow accessible interaction patterns.

## Forms

- Use React Hook Form + Zod when form complexity warrants them.
- Keep client validation aligned with server validation, but always validate on the server.
- Show field-level errors and submission-level failures clearly.
- Prevent accidental duplicate submissions.
