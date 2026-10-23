# Forge showcase: working rules

Public showcase of the Forge (Vuseia) app: README, screenshots, architecture overview. No app code lives here.
Repo: `D:\Forge\forge-showcase`. Remote: `ShobhitB2002/forge` (PUBLIC on GitHub; visibility is not changed by this repo's rules).

## Start here
- `docs/RULES.md`: branch model and gates.
- `docs/DEPLOYMENT.md`: what runs locally and what is skipped.
- `docs/HISTORY.md`: dated log.

## Branches
- `production`: published content. Changes only by merge from `integration` after the full gate passes.
- `integration`: combined work. Full gate on push.
- `task/<type>-<name>`: one task each. Fast gate on push (pre-push hook).
- Never commit directly to `production`.

## Git
- No history rewrites, no force push, no deleting branches with unique work.
- Commit messages: what changed and why.
