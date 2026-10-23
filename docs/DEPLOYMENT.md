# Forge showcase: deployment (local CI/CD)

Scripts: `tools/ci/`. Values: `tools/ci/ci.config.json`. Results: `D:\Forge\ci-runs\forge-showcase\` (`fast-latest.json`, `full-latest.json`, `deploy-latest.json`).

## Gates

| Gate | Trigger | Runs | Result |
|---|---|---|---|
| G1 fast | push of `task/*` (pre-push hook) | syntax, secret scan, docs | FAIL blocks the push |
| G2 full | push or merge to `integration` / `production` | G1 checks, clean tree before and after, app build SKIPPED, phone checks SKIPPED | FAIL blocks the push |
| G4 deploy | merge into `production` (post-merge hook, after G2 PASS) | nothing to deploy | SKIPPED with reason |

Run by hand: `powershell -ExecutionPolicy Bypass -File tools\ci\gate-fast.ps1` (or `gate-full.ps1`).
Install hooks: `powershell -ExecutionPolicy Bypass -File tools\ci\install-hooks.ps1`. There is no bypass.

## Deploy

SKIPPED. This repo is static content (README and screenshots). There is no app build and no server. GitHub Pages is not enabled (404 on the Pages API), so nothing is served from `production`.

## GitHub

- GitHub Actions for `ShobhitB2002/forge` are disabled (owner-approved, 2026-10-23).
- The repo is PUBLIC. Visibility was not changed by this restructure; owner decision if it should change.
