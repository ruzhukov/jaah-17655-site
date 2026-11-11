# T17655 site — agent hub

## What this is

A single static HTML page (`site/index.html`, no build step, no JavaScript, no dependencies),
published to GitHub Pages by `.github/workflows/pages.yml`.

## Hard rules

- **Publishing happens only from `main`.** Agent work merges into `develop`, which does not publish;
  someone merges `develop` into `main` to release. Never change the workflow's trigger unless a task asks.
- **The gate:** `scripts/gate.sh quick` and `scripts/gate.sh full`. Both must pass before a PR.
- **No secrets, no environment variables, no login.** The page reads nothing at runtime.

## Router

| Topic | Where |
|---|---|
| Viewing the page locally, how it is checked, how it publishes | `docs/development.md` |
| What the repo is (one line) | `README.md` |
| The page itself | `site/index.html` |
| Deployment workflow | `.github/workflows/pages.yml` |
| Gate commands | `scripts/gate.sh` |
| Pointer index for other agent tools | `AGENTS.md` |
| How agent docs are shaped | /usr/lib/jaahd/docs/policies/context-architecture.md (installed with Jaah; not copied here) |
