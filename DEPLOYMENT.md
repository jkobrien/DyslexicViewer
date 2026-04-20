## Deployment

DyslexicViewer is deployed as a **Progressive Web App on Cloudflare Pages**, with a fully automated CI/CD pipeline via **GitHub Actions**.

### How it works

Every push to `main` triggers an automatic build and deploy. Every pull request gets its own live **preview URL**, posted automatically as a comment — so you can review changes before they go live.

```
Push to main  →  GitHub Actions builds  →  Cloudflare Pages (production)
Open a PR     →  GitHub Actions builds  →  Cloudflare Pages (preview URL, posted to PR)
```

### Setting it up (one-time)

**1. Create a Cloudflare Pages project**

Log into [dash.cloudflare.com](https://dash.cloudflare.com) → Pages → Create a project.
When asked to connect a Git repo, skip it — we use GitHub Actions directly instead.
Name the project `dyslexicviewer`.

**2. Get your Cloudflare credentials**

You need two values from Cloudflare:

| Secret | Where to find it |
|---|---|
| `CLOUDFLARE_API_TOKEN` | Cloudflare Dashboard → My Profile → API Tokens → Create Token → use the **"Edit Cloudflare Workers"** template |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare Dashboard → right sidebar on any page |

**3. Add secrets to GitHub**

In your GitHub repo: Settings → Secrets and variables → Actions → New repository secret.

Add both `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID`.

**4. Push to main**

That's it. The pipeline runs automatically on every push.

### Files added

| File | Purpose |
|---|---|
| `.github/workflows/deploy.yml` | GitHub Actions pipeline — builds and deploys on push/PR |
| `_headers` | Cloudflare Pages headers — caching, security, PWA routing |
| `vite.config.ts` | Vite build config with PWA plugin and Tesseract chunk splitting |
| `tsconfig.json` | TypeScript compiler config |
| `package.json` | Project dependencies and scripts |

### Local development

```bash
npm install
npm run dev        # starts dev server at https://localhost:5173
npm run build      # production build → dist/
npm run type-check # TypeScript check without building
```

> HTTPS is required locally for camera access. Vite handles this automatically in dev mode.
