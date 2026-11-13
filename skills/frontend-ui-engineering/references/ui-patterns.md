# Frontend UI Engineering Patterns

## 1. Design System & shadcn/ui Reuse
- Always check `components/ui/` first before creating new UI primitives.
- When customizing a shadcn component, use the `cn()` utility (`clsx` + `tailwind-merge`) and design system CSS variables (`bg-primary`, `text-foreground`, `border-border`).
- Do not install duplicate UI libraries (e.g., mixing Chakra, MUI, and Mantine into a shadcn/ui project).

## 2. Tailwind CSS v4 Standards
- Use modern Tailwind v4 syntax. Tailwind v4 uses CSS-first configuration (`@import "tailwindcss";`, `@theme` blocks), eliminating legacy `tailwind.config.js` setups.
- Use native container queries, color-mix utilities, and modern CSS variables where appropriate.
- Ensure all components are responsive by default using mobile-first breakpoint modifiers (`sm:`, `md:`, `lg:`, `xl:`).

## 3. Icon Standards: `@tabler/icons-react`
- Standardize on Tabler Icons (`@tabler/icons-react`) for UI icons:
```tsx
import { IconAlertTriangle, IconCheck, IconChevronDown } from "@tabler/icons-react";

export function StatusBadge({ status }: { status: "active" | "warning" }) {
  return (
    <span className="inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-100 text-amber-800 dark:bg-amber-950 dark:text-amber-300">
      <IconAlertTriangle className="size-3.5" aria-hidden="true" />
      {status}
    </span>
  );
}
```

## 4. Form Handling: React Hook Form + Zod
Use React Hook Form coupled with Zod resolvers for robust, accessible form validation:

```tsx
"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";

const ContactSchema = z.object({
  email: z.string().email("Please enter a valid email address."),
  message: z.string().min(10, "Message must be at least 10 characters long."),
});

type ContactFormValues = z.infer<typeof ContactSchema>;

export function ContactForm() {
  const form = useForm<ContactFormValues>({
    resolver: zodResolver(ContactSchema),
    defaultValues: { email: "", message: "" },
  });

  const onSubmit = async (values: ContactFormValues) => {
    // Submit action
  };

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input placeholder="you@domain.com" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit" disabled={form.formState.isSubmitting}>
          {form.formState.isSubmitting ? "Sending..." : "Send Message"}
        </Button>
      </form>
    </Form>
  );
}
```

## 5. Intentional Animation: Framer Motion
- Use Framer Motion only when it adds meaningful clarity, hierarchy, or smooth transitions.
- Always respect user accessibility preferences with `useReducedMotion`:

```tsx
"use client";

import { motion, useReducedMotion } from "framer-motion";

export function AnimatedCard({ children }: { children: React.ReactNode }) {
  const shouldReduceMotion = useReducedMotion();

  return (
    <motion.div
      initial={shouldReduceMotion ? { opacity: 1 } : { opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.25, ease: "easeOut" }}
      className="p-6 rounded-xl border border-border bg-card"
    >
      {children}
    </motion.div>
  );
}
```

## 6. Shared Client State: Zustand
- Prefer React Server Components, URL query parameters, and local `useState` for UI state.
- Use Zustand only when state must genuinely be shared across disconnected client components (e.g., persistent audio player, global filter drawer, complex multi-step canvas):

```typescript
// stores/use-cart-drawer-store.ts
import { create } from "zustand";

interface CartDrawerStore {
  isOpen: boolean;
  openDrawer: () => void;
  closeDrawer: () => void;
}

export const useCartDrawerStore = create<CartDrawerStore>((set) => ({
  isOpen: false,
  openDrawer: () => set({ isOpen: true }),
  closeDrawer: () => set({ isOpen: false }),
}));
```

## 7. Mandatory UI State Checklist
For every user-facing component or feature:
- [ ] **Loading:** Render a skeleton with matching layout dimensions (`Skeleton` component).
- [ ] **Empty:** Provide a clear illustration/icon, explanatory message, and primary CTA.
- [ ] **Error:** Display actionable feedback with a retry action; do not show cryptic errors.
- [ ] **Success:** Provide subtle confirmation (toast, badge, or updated UI).
- [ ] **Disabled:** Disable buttons and inputs during pending submissions.
- [ ] **Responsive:** Verify layout at 375px (mobile), 768px (tablet), and 1280px (desktop).
- [ ] **Accessibility:** Confirm keyboard focus outline (`focus-visible:ring-2`), semantic HTML tags, and ARIA attributes.
