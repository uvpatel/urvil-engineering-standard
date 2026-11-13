---
name: frontend-ui-engineering
description: Build accessible, responsive React interfaces using the project's existing shadcn/ui components, Tailwind CSS v4, and standard interaction patterns. Use when designing, creating, or styling components, forms, layouts, or user interactions.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Frontend UI Engineering

## Core Design Standards

1. **Design System Discipline:** Inspect existing design tokens and primitives in `components/ui/` first. Extend existing shadcn/ui components rather than inventing duplicate styles.
2. **Tailwind CSS v4:** Use modern Tailwind v4 CSS-first conventions. Keep styling responsive by default with mobile-first breakpoints (`sm:`, `md:`, `lg:`).
3. **Icons Standard:** Standardize on Tabler Icons (`@tabler/icons-react`) unless explicitly overridden by project instructions.
4. **Form Handling:** Standardize on React Hook Form paired with Zod resolvers for type-safe form validation.
5. **Animation:** Use Framer Motion only when it adds meaningful user clarity, and always honor `prefers-reduced-motion` using `useReducedMotion`.
6. **Client State:** Use Zustand strictly for shared client-side application state. Prefer local state or URL search parameters for localized UI state.

## Mandatory State Coverage

Every user-facing interface must handle all six standard states:
- **Loading:** Skeleton placeholders matching component geometry.
- **Empty:** Informative empty state with icon and call to action.
- **Error:** Human-readable error message with recovery option.
- **Success:** Subtle feedback (toast or status badge).
- **Disabled:** Explicit disabled styling during ongoing submissions.
- **Responsive:** Fluid layout from mobile (375px) to desktop (1280px+).

## Accessibility Requirements

- Semantic HTML tags (`<main>`, `<nav>`, `<article>`, `<button>`).
- Visible focus rings (`focus-visible:ring-2`) on interactive controls.
- Keyboard navigation for all modals, dropdowns, and forms.
- Explicit ARIA labels on icon-only buttons.

## Reference Patterns

For detailed component patterns, form setup, and animation guidelines, consult [Frontend UI Patterns](references/ui-patterns.md).
