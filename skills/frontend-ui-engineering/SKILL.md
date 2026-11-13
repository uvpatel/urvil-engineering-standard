---
name: frontend-ui-engineering
description: Build accessible, responsive React interfaces using the project's existing shadcn/ui, Tailwind, design tokens, and interaction patterns.
---

# Frontend UI Engineering

## Discover

Inspect existing design tokens, fonts, breakpoints, components, shadcn configuration, Tailwind version, and page patterns before proposing UI.

## Rules

- Preserve the approved design direction.
- Reuse shadcn/ui and existing primitives.
- Match the installed Tailwind major version; use v4 conventions only when v4 is installed.
- Use `@tabler/icons-react` unless overridden.
- Use Framer Motion only for meaningful motion and respect reduced-motion preferences.
- Prefer semantic HTML and accessible primitives.
- Keep components cohesive and responsive.
- Avoid giant page components; compose sections by responsibility.
- Do not add dependencies or create a parallel design system without approval.

## State coverage

Include loading, empty, error, success, disabled, and responsive states where relevant.

## Accessibility review

Check keyboard use, focus visibility, labels, accessible names, heading order, contrast, and reduced motion.

## Verification

Use existing lint/type/test scripts and inspect the rendered result where tools permit.
