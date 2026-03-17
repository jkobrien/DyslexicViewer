# Bug Fix Workflow

## Principle: Investigate First, Fix Second

Never jump straight to changing code. Always understand the root cause before writing a fix.

## Workflow Steps

### 1. Reproduce the Bug
- Identify the exact steps to reproduce the issue
- Note the expected vs actual behaviour
- Check if the bug is intermittent or consistent

### 2. Isolate the Cause
Before touching any code:
- Read the relevant code paths end-to-end
- Check Convex logs / browser console for errors
- Identify the single root cause (not symptoms)

### 3. Form a Hypothesis
- State the hypothesis: _"The bug occurs because X does Y when it should do Z"_
- Validate the hypothesis before fixing

### 4. Write the Minimal Fix
- Fix only the root cause
- Do not refactor or clean up unrelated code in the same change
- Prefer a small, surgical change over a large rewrite

### 5. Verify the Fix
- Reproduce the original steps — confirm the bug is gone
- Check that no related functionality is broken
- Run E2E tests: `npm run test:e2e` (from `apps/web`)

### 6. Run Lint Fix Before Committing
```bash
npx ultracite fix
```

## Common Pitfalls to Avoid

- **Fixing symptoms instead of root cause** — if a value is null unexpectedly, find out why it's null rather than just adding a null check
- **Over-engineering the fix** — keep it simple and targeted
- **Skipping reproduction** — always confirm you can reproduce before fixing
- **Not checking edge cases** — consider what happens with empty arrays, null values, and boundary conditions
