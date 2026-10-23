# Forge showcase: rules

Model: `D:\ForgeLoop\GENERAL_MODEL_2026-10-21.md` (owner-approved 2026-10-21).

1. Checks run locally on the owner's PC. GitHub Actions for this repo are disabled and must not be re-enabled. GitHub is a versioned backup.
2. Branches: `production` (published), `integration` (combined work), `task/*` (one task each).
3. Every `task/*` push runs the fast gate (G1, pre-push hook): syntax, secret scan, docs.
4. Every push or merge to `integration` and `production` runs the full gate (G2): G1 plus clean tree before and after.
5. Deploy: SKIPPED (no deploy target; see DEPLOYMENT.md).
6. Never commit to `production` directly. Never force-push. Never delete files or branches; move them to `D:\_quarantine\`.
7. No secrets in the repo.
8. The repo is public. Do not add private material, owner notes, or credentials here.
