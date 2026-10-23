# G1 fast gate (showcase): syntax, no secrets tracked, docs present. Runs on push of task/*.
. (Join-Path $PSScriptRoot 'lib.ps1')
$run = New-Run 'fast'
[void](Invoke-Step $run 'syntax' { Test-Syntax })
[void](Invoke-Step $run 'no-secrets' { Test-NoSecrets })
[void](Invoke-Step $run 'docs' { Test-Docs })
exit (Complete-Run $run)
