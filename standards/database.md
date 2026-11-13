# Database Standards

Choose MongoDB/Mongoose or PostgreSQL/Drizzle according to the approved project requirements. Do not mix persistence technologies without a clear reason and approval.

## Modeling

- Model around access patterns, invariants, and lifecycle—not only UI screens.
- Define ownership and tenant boundaries explicitly.
- Use appropriate unique constraints and indexes.
- Avoid storing redundant derived values unless there is a deliberate consistency strategy.
- Normalize relational data where integrity and querying benefit; embed MongoDB documents when access patterns and bounded growth justify it.
- Define deletion, archival, and retention behavior.
- Use migrations for schema changes where the database/tooling supports them.

## Queries

- Select only needed fields.
- Bound list queries and use pagination.
- Avoid unbounded array growth and expensive full collection scans.
- Inspect query plans for performance-sensitive paths.
- Use transactions where atomicity is required and supported.
- Handle duplicate keys, optimistic concurrency, and race conditions.

## Boundaries

- Keep database access in server-only modules.
- Do not return raw ORM/ODM objects to the browser.
- Map persistence models to explicit response DTOs.
- Never log credentials or sensitive document contents.
