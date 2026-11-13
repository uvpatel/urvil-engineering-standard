# Modular Refactoring Patterns

## 1. Core Principles
- **Behavior Preservation:** A refactor must never alter user-observable behavior, layout styling, or API contracts unless explicitly approved.
- **Cohesion over Line Count:** Do not break files purely to satisfy an arbitrary number. Extract a module when it isolates a distinct responsibility (e.g., UI presentation vs. data fetching vs. validation vs. persistence).
- **Avoid Dumping Grounds:** Never create catch-all `utils.ts` or `helpers.ts` files. Name modules after their domain responsibility (e.g., `date-formatter.ts`, `currency-calculator.ts`, `auth-guards.ts`).
- **Composition over Prop Explosions:** Replace components that take 15 boolean flags with cohesive sub-components composed together.

## 2. Decomposition Strategy for Monolithic Components

When faced with a monolithic component (>300–500 lines):

### Step A: Identify Boundaries
1. **Presentation / Layout Sections:** Header, sidebar, data table, modal, toolbar.
2. **Local Interaction Logic:** Form state, filter dropdown state, pagination logic.
3. **Data Fetching & Cache Mutations:** Server actions, queries, SWR/React Query hooks.
4. **Validation & Business Transformations:** Input schemas, status mapping, calculations.

### Step B: Extraction Hierarchy
Organize extracted files in a cohesive feature folder:

```text
src/features/billing/
├── components/
│   ├── billing-overview.tsx       # Orchestrating component (~80 lines)
│   ├── invoice-table.tsx          # Cohesive sub-component (~100 lines)
│   ├── payment-method-card.tsx    # Presentation primitive (~60 lines)
│   └── plan-upgrade-dialog.tsx    # Modal UI boundary (~90 lines)
├── hooks/
│   └── use-invoice-filters.ts     # Client state & URL param sync (~50 lines)
├── schemas/
│   └── billing.schema.ts          # Zod validation schemas (~30 lines)
├── services/
│   └── billing.service.ts         # Server-side business & db logic (~90 lines)
└── types/
    └── billing.types.ts           # Domain types & DTO interfaces (~40 lines)
```

## 3. Extracting Custom Hooks for Complex State
If a component has multiple `useState`, `useCallback`, and `useEffect` calls managing related state (e.g., search, filter, and pagination):

```tsx
// Before: Cluttering the main component
// After: Cohesive custom hook
export function useInvoiceFilters() {
  const [search, setSearch] = useState("");
  const [status, setStatus] = useState<InvoiceStatus | "all">("all");
  const [page, setPage] = useState(1);

  const resetFilters = useCallback(() => {
    setSearch("");
    setStatus("all");
    setPage(1);
  }, []);

  return {
    search,
    setSearch,
    status,
    setStatus,
    page,
    setPage,
    resetFilters,
  };
}
```

## 4. Extracting Pure Business Functions
Business calculations should be pure, testable TypeScript functions with no React or Next.js dependencies:

```typescript
// src/features/billing/services/tax-calculator.ts
export function calculateInvoiceTotals(
  items: ReadonlyArray<{ quantity: number; unitPriceInCents: number }>,
  taxRatePercent: number
): { subtotal: number; tax: number; total: number } {
  const subtotal = items.reduce(
    (sum, item) => sum + item.quantity * item.unitPriceInCents,
    0
  );
  const tax = Math.round(subtotal * (taxRatePercent / 100));
  const total = subtotal + tax;

  return { subtotal, tax, total };
}
```

## 5. Verification Protocol
1. Run `bun run typecheck` to confirm no broken interfaces.
2. Run `bun run test` to ensure existing tests pass.
3. Inspect `git diff` to confirm zero unintended behavioral or stylistic alterations.
