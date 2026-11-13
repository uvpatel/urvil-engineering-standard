# Performance Audit Checklist

Never optimize without baseline measurements and clear user impact evidence.

---

## 1. Core Web Vitals (CWV) Audit
- [ ] **LCP (Largest Contentful Paint < 2.5s):**
  - Is the hero image or primary text block rendered via Server Components?
  - Are critical images using `next/image` with `priority` and explicit `sizes`?
  - Are external web fonts loaded via `next/font` with zero layout shift?
- [ ] **INP (Interaction to Next Paint < 200ms):**
  - Are heavy JavaScript computations blocking the main thread during clicks or inputs?
  - Are client-side transitions wrapped in `useTransition` where appropriate?
- [ ] **CLS (Cumulative Layout Shift < 0.1):**
  - Do dynamic images, videos, and ads have reserved width/height containers?
  - Are skeleton placeholders matching the exact dimensions of final rendered components?

---

## 2. Next.js 16+ & React 19 Bundle Optimization
- [ ] **RSC Boundary Check:** Are client boundaries (`"use client"`) placed at the smallest practical leaf components?
- [ ] **Third-Party Package Size:** Are massive dependencies (e.g., `lodash`, `moment`, giant icon packs) imported indiscriminately? (Use `@tabler/icons-react` with specific named imports).
- [ ] **Dynamic Imports:** Are heavy non-critical components (charts, markdown editors, PDF viewers) loaded dynamically with `next/dynamic`?

---

## 3. Network & Data Fetching Waterfalls
- [ ] **Waterfall Detection:** Are independent asynchronous operations chained sequentially with `await` when they could run concurrently?
  ```typescript
  // Bad: Waterfall (sequential)
  const user = await getUser(id);
  const projects = await getProjects(id);

  // Good: Concurrent
  const [user, projects] = await Promise.all([
    getUser(id),
    getProjects(id),
  ]);
  ```
- [ ] **Over-fetching:** Is the API or database query fetching entire records when only 3 fields are needed in the UI?

---

## 4. Database & Query Performance
- [ ] **Query Projections:** Drizzle `.select({ ... })` or Mongoose `.select("...")` used to return only required columns/fields.
- [ ] **Mongoose `.lean()`:** Ensure read-only Mongoose queries use `.lean()` to avoid document hydration overhead.
- [ ] **Indexes:** Verify that fields in `where`, `orderBy`, and foreign key joins have corresponding database indexes.
- [ ] **Bounded Limits:** Confirm all list endpoints and queries have explicit limits and pagination.

---

## 5. Audit Report Format
When presenting audit findings:
1. **Symptom & Baseline:** Current observed metric or latency.
2. **Root Cause Evidence:** Specific line of code, network waterfall, or query plan.
3. **Proposed Fix:** Specific architectural or code change.
4. **Expected Impact & Verification:** How the fix will be measured and verified.
