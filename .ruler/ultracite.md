# Ultracite Code Style Standards

Ultracite enforces Biome linting and formatting rules across the monorepo.

## Run Before Every Commit

```bash
npx ultracite fix
```

This auto-fixes all fixable Biome lint and format issues.

## Key Style Rules

### Imports
- Use named imports over default imports where possible
- Group and sort imports: external → internal → relative
- No unused imports (enforced by Biome)

### TypeScript
- `strict: true` in all `tsconfig.json` files — no exceptions
- No `any` types — use `unknown` and narrow with type guards
- Prefer `interface` for object shapes, `type` for unions/intersections

### Functions
- Prefer arrow functions for callbacks and short utilities
- Use `async/await` over `.then()` chains
- No `console.log` in committed code (use structured logging or remove)

### React
- One component per file
- Props typed with explicit interfaces or inline types
- No implicit `children` — type them explicitly
- Use `"use client"` directive only when necessary (avoid it in server components)

### Naming
- PascalCase for components and types
- camelCase for variables, functions, and hooks
- SCREAMING_SNAKE_CASE for constants
- kebab-case for file names

### Formatting
- 2-space indentation
- Double quotes for strings in JSX/TSX
- Single quotes for strings in plain TS/JS
- Trailing commas in multi-line structures
- Semicolons required

## Check Without Auto-fix

```bash
npm run check        # From monorepo root
```

## Configuration

Biome config extends Ultracite defaults via `biome.json` at the monorepo root:

```json
{
  "$schema": "https://biomejs.dev/schemas/1.9.4/schema.json",
  "extends": ["ultracite"]
}
```
