# Performance Patterns

## N+1 Prevention

Never issue queries inside a loop. A classic N+1 happens when you fetch a list and then query each item individually.

### ❌ Bad — N+1 pattern
```ts
// Fetching related data inside a loop
const items = await ctx.db.query("items").collect();
const results = await Promise.all(
  items.map(item => ctx.db.get(item.relatedId)) // N queries
);
```

### ✅ Good — Batch fetch pattern
```ts
// Collect all IDs first, then batch fetch
const items = await ctx.db.query("items").collect();
const relatedIds = items.map(item => item.relatedId);
const related = await Promise.all(relatedIds.map(id => ctx.db.get(id)));
```

## withIndex Usage

Always use `.withIndex()` for filtered queries instead of fetching all documents and filtering in memory.

### ❌ Bad — In-memory filter
```ts
const allItems = await ctx.db.query("items").collect();
const filtered = allItems.filter(item => item.userId === userId);
```

### ✅ Good — withIndex filter
```ts
// Requires index defined in schema: defineTable({ userId: v.id("users") }).index("by_userId", ["userId"])
const filtered = await ctx.db
  .query("items")
  .withIndex("by_userId", q => q.eq("userId", userId))
  .collect();
```

## Defining Indexes in Schema

```ts
// packages/backend/convex/schema.ts
import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";

export default defineSchema({
  items: defineTable({
    userId: v.id("users"),
    content: v.string(),
    createdAt: v.number(),
  })
    .index("by_userId", ["userId"])
    .index("by_userId_and_createdAt", ["userId", "createdAt"]),
});
```

## Pagination

For large datasets, use Convex's built-in pagination instead of `.collect()`.

```ts
const { page, isDone, continueCursor } = await ctx.db
  .query("items")
  .withIndex("by_userId", q => q.eq("userId", userId))
  .paginate(paginationOpts);
```

## Summary of Rules

- No `.filter()` on Convex results — always use `.withIndex()`
- No queries inside loops — batch with `Promise.all`
- Define indexes in `schema.ts` for every field you query by
- Use pagination for unbounded collections
