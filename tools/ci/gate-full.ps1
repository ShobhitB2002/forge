# G2 full gate (showcase): fast checks, clean tree before and after. No app build exists in this repo.
. (Join-Path $PSScriptRoot 'lib.ps1')
$run = New-Run 'full'
[void](Invoke-Step $run 'clean-tree-before' { $d = Get-Dirty; if ($d) { throw "working tree not clean:`n$d" }; 'clean' })
[void](Invoke-Step $run 'syntax' { Test-Syntax })
[void](Invoke-Step $run 'no-secrets' { Test-NoSecrets })
[void](Invoke-Step $run 'docs' { Test-Docs })
[void](Invoke-Step $run 'app-build' { 'SKIPPED: no app build in this repo' })
[void](Invoke-Step $run 'phone-checks' { 'SKIPPED: no device app in this repo' })
[void](Invoke-Step $run 'clean-tree-after' { $d = Get-Dirty; if ($d) { throw "gate left the tree dirty:`n$d" }; 'clean' })
exit (Complete-Run $run)
