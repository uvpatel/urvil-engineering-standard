# Testing and Verification

Use the project's existing test stack. Do not add a new test framework without approval.

## Test levels

- Unit test pure business logic, transformations, validators, and utilities.
- Integration test database/service boundaries and API behavior.
- Component test meaningful UI interactions and accessibility behavior.
- End-to-end test critical user journeys and authorization boundaries.

## Required verification

Before completion:
1. Inspect the final diff.
2. Run relevant lint checks.
3. Run TypeScript checks.
4. Run relevant unit/integration tests.
5. Run a production build when practical.
6. Verify the changed behavior manually or with E2E tests when appropriate.
7. Report commands and exact outcomes.

## Honest reporting

- Do not say "all tests pass" if tests were not run.
- Distinguish failed, skipped, unavailable, and not-applicable checks.
- Explain environment blockers.
- Do not fix unrelated failures without approval.
