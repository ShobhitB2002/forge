# Forge showcase: AI worker entry

## What it is
Public showcase of the Forge app: `README.md` (the main public description) and screenshots. No app code and no private material live here.
Repo `D:\Forge\forge-showcase`, GitHub `ShobhitB2002/forge` (PUBLIC; visibility is an owner decision).

## Commands
- Gates (local, run by git hooks): `powershell -ExecutionPolicy Bypass -File tools\ci\gate-fast.ps1` or `gate-full.ps1`
- Install hooks once: `powershell -ExecutionPolicy Bypass -File tools\ci\install-hooks.ps1` (no bypass)
- Results: `D:\Forge\ci-runs\forge-showcase\` (`fast-latest.json`, `full-latest.json`, `deploy-latest.json`)

## Ports and paths
Ports: none. Paths: only the repo and the results folder above.

## Hard rules
- Public repo: README and feature text only. No code, secrets, credentials, owner notes, private paths or key details.
- Branches: `production` (published), `integration` (combined work), `task/<type>-<name>` (one task each). Never commit to `production`; merge from `integration` after the full gate passes.
- Gates: every `task/*` push runs G1 fast (syntax, secret scan, docs). Every push or merge to `integration` and `production` runs G2 full (G1 plus clean tree before and after; app build and phone checks SKIPPED, nothing to build).
- Deploy: SKIPPED, always. Static content, no app build, no server; GitHub Pages is not enabled (404), so nothing is served from `production`.
- GitHub Actions are disabled (owner-approved, 2026-10-23) and must not be re-enabled; GitHub is a versioned backup.
- No force-push, no history rewrite. Never delete files or branches with unique work; move files to `D:\_quarantine\`.
- Keep README numbers true: no line, test or table counts that drift. Facts come from the private repo's code.

## Code map
`README.md` public description; `screenshots/` images used by it; `tools/ci/` local gates and hooks.

## Live state safety
Nothing here touches live data. The README must never describe a feature that the app does not have.

## Known traps
- `production` was renamed from `main` on 2026-10-23 (history kept).
- G2 SKIPPED lines for build, phone and deploy are expected, not failures.

## More
`README.md`. App-side rules, release and backlog live in the private app repo (`D:\Forge\forge`).
