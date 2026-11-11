#!/usr/bin/env bash
# Repo gate: `scripts/gate.sh quick` or `scripts/gate.sh full`. Exits non-zero on any failure.
# quick — the context-architecture checker, where installed (skipped with a note elsewhere).
# full  — quick, plus a check that the GitHub Pages artifact (site/) is what CI would upload.
set -euo pipefail
cd "$(dirname "$0")/.."

tier="${1:-}"
case "$tier" in quick|full) ;; *) echo "usage: $0 quick|full" >&2; exit 2 ;; esac

checker=/usr/lib/jaahd/tools/check_context.py
if [ -f "$checker" ]; then
  python3 "$checker" --repo .
else
  echo "SKIPPED: context check ($checker not installed on this machine)"
fi

if [ "$tier" = full ]; then
  # .github/workflows/pages.yml uploads site/ as-is; its entry page must exist and be non-empty.
  [ -s site/index.html ] || { echo "FAIL: site/index.html missing or empty" >&2; exit 1; }
  grep -qi '<html' site/index.html || { echo "FAIL: site/index.html is not an HTML document" >&2; exit 1; }
  echo "site/ artifact ok"
fi

echo "GATE $tier: PASS"
