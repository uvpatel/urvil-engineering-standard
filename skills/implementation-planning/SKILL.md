---
name: implementation-planning
description: Create a detailed, actionable implementation plan for a feature, refactor, migration, or cross-cutting change before coding. Use when preparing substantial architectural changes, new feature work, or multi-file refactoring.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Implementation Planning

## Mandatory Approval Gate

**Planning is not permission to write code.** Do not modify or create application files until the developer explicitly approves the written plan.

## Planning Protocol

1. **Perform Discovery:** Inspect existing code, dependencies, and configuration relevant to the request.
2. **Clarify Scope:** Restate requirements, acceptance criteria, and surface only blocking technical questions.
3. **Propose Smallest Solution:** Design the simplest, most modular architecture that satisfies requirements without speculative abstraction.
4. **Define Contracts & Data Flow:** Specify data flow through transport, Zod validation, services, database persistence, and UI states.
5. **Enumerate File Changes:** Provide an exact table of files to create, update, or delete with concrete justifications.
6. **Cover Non-Functional Requirements:** Address security (server auth, anti-IDOR), performance (RSC first, query bounds), accessibility (keyboard navigation, ARIA), and error states.
7. **Define Verification:** List exact commands that exist in `package.json` (prefer `bun run typecheck`, `bun run lint`, `bun run test`, `bun run build`).

## Plan Template

Always format the written plan using the structured format provided in [Implementation Plan Template](references/plan-template.md).

## Stop Condition

End every implementation plan with:

> *"Please approve this plan or tell me what to change. I will not implement until you approve."*

Wait for explicit approval. After approval, implement only the approved scope. If material assumptions change, stop and re-plan.
