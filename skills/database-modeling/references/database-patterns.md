# Database Modeling & Query Patterns

## 1. Approved Database Stacks
Respect the project's selected database technology. Do not change between SQL and NoSQL without explicit developer approval.
- **Relational:** PostgreSQL with Drizzle ORM
- **Document:** MongoDB with Mongoose ODM

---

## 2. PostgreSQL + Drizzle ORM Patterns

### Schema Definition
Define relational tables, explicit constraints, foreign keys, and indexes in dedicated schema files:

```typescript
// db/schema/organizations.ts
import { pgTable, text, timestamp, uuid, index } from "drizzle-orm/pg-core";

export const organizations = pgTable(
  "organizations",
  {
    id: uuid("id").defaultRandom().primaryKey(),
    name: text("name").notNull(),
    slug: text("slug").notNull().unique(),
    createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
    updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
  },
  (table) => [
    index("org_slug_idx").on(table.slug),
  ]
);
```

### Drizzle Query Hygiene
- Always project only the columns required by the caller.
- Use explicit limit and offset or cursor-based pagination.
- Wrap multi-table operations in transactions:

```typescript
// services/organization.service.ts
import { db } from "@/db";
import { organizations } from "@/db/schema";
import { eq } from "drizzle-orm";

export async function getOrganizationBySlug(slug: string) {
  const [org] = await db
    .select({
      id: organizations.id,
      name: organizations.name,
      slug: organizations.slug,
    })
    .from(organizations)
    .where(eq(organizations.slug, slug))
    .limit(1);

  return org ?? null;
}
```

---

## 3. MongoDB + Mongoose ODM Patterns

### Document Schema Design
- **Embedding vs. Referencing:** Embed data that is accessed together, bounded in size (<100 items), and has the same lifecycle. Reference separate collections for independent or unbounded data.
- **Avoid Unbounded Arrays:** Never append indefinitely to an embedded array within a single document.
- **Indexes:** Define compound indexes matching exact query patterns.

```typescript
// models/workspace.model.ts
import mongoose, { Schema, type Document, type Model } from "mongoose";

export interface IWorkspace extends Document {
  name: string;
  ownerId: string;
  membersCount: number;
  createdAt: Date;
  updatedAt: Date;
}

const WorkspaceSchema = new Schema<IWorkspace>(
  {
    name: { type: String, required: true, trim: true, maxlength: 100 },
    ownerId: { type: String, required: true, index: true },
    membersCount: { type: Number, default: 1, min: 1 },
  },
  {
    timestamps: true,
  }
);

WorkspaceSchema.index({ ownerId: 1, createdAt: -1 });

export const Workspace: Model<IWorkspace> =
  mongoose.models.Workspace || mongoose.model<IWorkspace>("Workspace", WorkspaceSchema);
```

### Mongoose Query Hygiene
- Always use `.lean()` on read-only queries to bypass Mongoose document hydration overhead.
- Explicitly select projected fields via `.select()`.
- Use `.limit()` and pagination.

```typescript
export async function getWorkspacesForUser(ownerId: string, limit = 20) {
  return Workspace.find({ ownerId })
    .select("_id name membersCount createdAt")
    .sort({ createdAt: -1 })
    .limit(limit)
    .lean()
    .exec();
}
```

---

## 4. Migration & Safety Rules
1. **Never drop tables, collections, or columns without explicit developer approval.**
2. **Schema Migrations:** For Drizzle, generate migrations using `bunx drizzle-kit generate` and apply with `bunx drizzle-kit migrate`. Review migration SQL before execution.
3. **Data Protection:** Never store plaintext passwords or secrets in database tables.
