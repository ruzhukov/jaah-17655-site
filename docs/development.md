# Development

## Layout

| Path | What it is |
|---|---|
| `site/` | The whole site. Everything in it is published as-is; there is no build step. |
| `.github/workflows/pages.yml` | Uploads `site/` and deploys it to GitHub Pages. |
| `scripts/gate.sh` | The quick and full gate. |

## Viewing the page

There is no local stack and no run setup (the owner chose none). Open `site/index.html` in a browser,
or serve the folder with any static server, e.g. `python3 -m http.server -d site 8000`, then open
`http://localhost:8000/`. The page needs no settings, secrets or login.

## Checks

CI runs no tests: `pages.yml` only uploads `site/` and deploys it.

- `scripts/gate.sh quick` — the context-architecture checker, when installed (skipped with a note
  where it is not, e.g. a developer laptop or CI).
- `scripts/gate.sh full` — quick, plus a check that `site/index.html` exists, is non-empty and is HTML
  (the entry page of what CI uploads).

## Publishing

`pages.yml` deploys on every push to `main` and on a manual run (`workflow_dispatch`). The `develop`
branch, where agent PRs land, does not publish: to release, merge `develop` into `main`.
