---
name: implementation-planning
description: Create an implementation plan for a feature, refactor, migration, or cross-cutting change. Use before substantial coding; always wait for explicit approval.
---

# Implementation Planning

## Mandatory approval gate

Planning is not permission to code. Do not edit application files until the developer explicitly approves the plan.

## Procedure

1. Perform `project-discovery`.
2. Restate requirements and acceptance criteria.
3. Identify assumptions and ask only blocking questions.
4. Propose the smallest architecture that meets requirements.
5. Describe data flow, component responsibilities, API contracts, validation, persistence, and state.
6. List exact files to create, update, and delete, with reasons.
7. Identify dependencies; prefer existing packages.
8. Cover security, accessibility, responsive behavior, loading/error/empty states, performance, and compatibility.
9. Define verification commands based on scripts that actually exist.
10. Identify risks and rollback considerations.

## Plan format

Use `templates/implementation-plan.md`.

## Stop condition

End with: "Please approve this plan or tell me what to change. I will not implement until you approve."

After approval, follow the plan. If a material change is needed, stop and seek renewed approval.
