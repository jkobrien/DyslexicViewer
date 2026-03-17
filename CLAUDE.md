# DyslexicViewer — Project Guide

## Overview

DyslexicViewer is a web application that uses the device camera to capture text and simulate how it might appear to someone with dyslexia. Users can choose from multiple levels to experience different types of reading difficulties caused by various forms of dyslexia.

## Project Structure

```
DyslexicViewer/
├── apps/
│   └── web/                    # Next.js 14 App Router frontend
│       ├── src/
│       │   ├── app/            # App Router pages and layouts
│       │   ├── components/ui/  # shadcn/ui components
│       │   ├── hooks/          # Custom React hooks
│       │   └── lib/            # Utility functions
│       └── uat/tests/          # Playwright E2E tests
├── packages/
│   └── backend/                # Convex backend
│       └── convex/             # Convex functions and schema
├── scripts/
│   └── ralph/                  # Ralph agent orchestration
│       ├── agents/output/      # Agent feedback logs
│       └── prds/               # PRD JSON files by feature
└── .ruler/                     # On-demand reference files
```

## Tech Stack

| Layer        | Technology                                    |
|--------------|-----------------------------------------------|
| Frontend     | Next.js 15 (App Router), TypeScript (strict)  |
| Styling      | Tailwind CSS, shadcn/ui, Lucide Icons         |
| Forms        | React Hook Form + Zod                         |
| Toasts       | Sonner                                        |
| Backend      | Convex                                        |
| Linting      | Biome via Ultracite                           |
| E2E Testing  | Playwright                                    |
| Monorepo     | Turborepo + npm workspaces                    |

## CLI Commands

### Development

```bash
npm run dev              # Start all dev servers (Turborepo)
```

### Building

```bash
npm run build            # Full monorepo build via Turborepo
```

### Type Checking

```bash
npm run check-types      # TypeScript type check across all packages
```

### Linting & Formatting

```bash
npm run check            # Biome lint check
npx ultracite fix        # Auto-fix lint issues (run before committing)
```

### Convex

```bash
npx -w packages/backend convex dev      # Start Convex dev server
npx -w packages/backend convex codegen # Regenerate Convex types
```

### Testing

```bash
npm run test:e2e         # Run Playwright E2E tests (from apps/web)
```

## Critical Rules

1. **Always run `npx ultracite fix` before committing** — this auto-fixes Biome lint issues and ensures code style consistency.
2. **No N+1 queries** — always batch Convex fetches; never query inside a loop. See `.ruler/performance-patterns.md`.
3. **No `.filter()` on Convex query results** — use `.withIndex()` for filtering at the database level.
4. **E2E tests only** — no unit tests (Vitest/Jest). All tests live in `apps/web/uat/tests/`.
5. **Strict TypeScript** — `strict: true` is enforced in all packages.
6. **Dev server runs on port 5000** — configured in `apps/web/package.json`.

## Reference Files (`.ruler/`)

Read these on-demand for detailed guidance:

- `.ruler/performance-patterns.md` — N+1 prevention, batch fetch patterns, withIndex usage
- `.ruler/bug-fix-workflow.md` — Investigation-first bug fix workflow
- `.ruler/ultracite.md` — Code style standards enforced by Ultracite/Biome
