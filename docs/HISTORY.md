# Forge showcase: history

## 2026-10-23: restructure (local CI/CD)
- Moved `D:\forge-showcase` to `D:\Forge\forge-showcase`. Sourcetree bookmark updated.
- GitHub `forge` (PUBLIC, visibility unchanged): `main` renamed to `production` (history kept). `integration` created from it.
- Local `main` renamed to `production`.
- Added `tools/ci/` (G1 fast, G2 full, pre-push and post-merge hooks). Deploy SKIPPED (see DEPLOYMENT.md).
- Added `CLAUDE.md`, `docs/RULES.md`, `docs/DEPLOYMENT.md`, `docs/HISTORY.md`.
- GitHub Actions disabled for this repo (owner-approved).
- Backup before the move: `E:\ProjectBackups\2026-10-23\Forge\` (folder copy plus `git bundle --all`).
