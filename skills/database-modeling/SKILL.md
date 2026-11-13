---
name: database-modeling
description: Model, query, index, and evolve MongoDB/Mongoose or PostgreSQL/Drizzle data structures based on product requirements and access patterns.
---

# Database Modeling

## Discover

Identify the selected database, installed ORM/ODM version, schema conventions, migrations, indexes, and real query patterns.

## Design

- Start from entities, invariants, ownership, lifecycle, and access patterns.
- For PostgreSQL, define relationships, constraints, indexes, migrations, and transaction boundaries.
- For MongoDB, choose embedding vs referencing based on access patterns and bounded growth.
- Define uniqueness and concurrency behavior.
- Plan deletion, archival, and retention.

## Query quality

- Project only required fields.
- Paginate and bound results.
- Avoid N+1 and unbounded reads.
- Add indexes for demonstrated query patterns.
- Inspect explain/query plans for hot paths.

## Safety

- Keep database access server-only.
- Never return raw persistence objects to clients.
- Validate and authorize before writes.
- Never expose credentials or sensitive fields.

## Approval

Schema migrations, destructive changes, and database technology changes always require explicit approval.
