---
name: database-modeling
description: Model, query, index, and migrate database structures using PostgreSQL with Drizzle ORM or MongoDB with Mongoose ODM. Use when creating schemas, adding relations, writing queries, creating migrations, or indexing databases.
license: MIT
metadata:
  author: Urvil Patel
  version: 1.0.0
---

# Database Modeling

## Technology Selection

Adhere strictly to the project's selected database technology:
- **Relational:** PostgreSQL with Drizzle ORM.
- **Document:** MongoDB with Mongoose ODM.

Never switch persistence technologies or mix them without explicit developer approval.

## Modeling Principles

- **Access Patterns First:** Model data around real query and mutation patterns, lifecycle, and access boundaries.
- **PostgreSQL / Drizzle:** Define explicit constraints, foreign keys, relationships, and indexes. Maintain migrations with Drizzle Kit.
- **MongoDB / Mongoose:** Choose embedding vs. referencing based on cardinality (<100 items for embedding). Prevent unbounded array growth.
- **Server-Only Persistence:** Keep database connections and queries strictly on the server. Never expose database clients to the browser.
- **Data Privacy:** Never store plaintext passwords or sensitive secrets.

## Query Hygiene

1. **Explicit Projections:** Always project only the columns or fields needed by the application.
2. **Bounded Queries:** Always use pagination (`limit` and `offset`/cursor). Avoid unbounded reads.
3. **Mongoose `.lean()`:** Use `.lean()` for read-only queries to bypass hydration overhead.
4. **Index Verification:** Ensure indexes exist for all `where`, `orderBy`, and foreign key lookup patterns.

## Approval Gate

Schema migrations, column removals, collection deletions, and database technology alterations require explicit developer approval before execution.

## Reference Patterns

For detailed Drizzle schema definitions, Mongoose models, and query patterns, consult [Database Modeling Patterns](references/database-patterns.md).
