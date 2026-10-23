#!/bin/sh
# Git hook shim. Installed by tools/ci/install-hooks.ps1.
root="$(git rev-parse --show-toplevel)" || exit 0
script="$root/tools/ci/hooks.ps1"
[ -f "$script" ] || { echo "PUSH BLOCKED: tools/ci is missing in this branch; the gate cannot run."; cat > /dev/null; exit 1; }
refs="$(mktemp)"; cat > "$refs"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$(cygpath -w "$script")" -Hook pre-push -RefsFile "$(cygpath -w "$refs")"
code=$?; rm -f "$refs"; exit $code
