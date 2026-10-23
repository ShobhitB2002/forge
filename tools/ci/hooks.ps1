# Hook logic. -Hook pre-push -RefsFile <file with git's stdin>  |  -Hook post-merge
# pre-push: production or integration -> gate-full; any other branch -> gate-fast. Blocks on FAIL.
# post-merge: only when production is checked out: gate-full, then the deploy step. Git ignores the exit code here.
param([string]$Hook, [string]$RefsFile = '')
. (Join-Path $PSScriptRoot 'lib.ps1')
$cfg = $script:Cfg
if ($Hook -eq 'pre-push') {
  $zero = '0' * 40; $level = 'none'; $head = Get-Sha
  $lines = @(); if ($RefsFile -and (Test-Path $RefsFile)) { $lines = @(Get-Content $RefsFile) }
  foreach ($ln in $lines) {
    if (-not $ln.Trim()) { continue }
    $p = $ln.Trim() -split '\s+'; $name = $p[2] -replace '^refs/heads/', ''
    if ($p[1] -eq $zero) { continue }
    if ($p[1] -ne $head) { Write-Host "PUSH BLOCKED: $name is not the checked-out HEAD. Check it out, then push."; exit 1 }
    if ($name -eq $cfg.branches.production -or $name -eq $cfg.branches.integration) { $level = 'full' } elseif ($level -eq 'none') { $level = 'fast' }
  }
  if ($level -eq 'none') { exit 0 }
  & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot "gate-$level.ps1")
  if ($LASTEXITCODE) { Write-Host "PUSH BLOCKED: gate-$level failed"; exit 1 }
  exit 0
}
if ($Hook -eq 'post-merge') {
  if ((Get-Branch) -ne $cfg.branches.production) { exit 0 }
  & powershell -NoProfile -ExecutionPolicy Bypass -File (Join-Path $PSScriptRoot 'gate-full.ps1')
  if ($LASTEXITCODE) { Write-Host 'gate-full failed: NOT deploying'; exit 1 }
  if (-not $cfg.liveRoot) {
    $dir = Join-Path $cfg.runsDir 'deploy'; New-Item -ItemType Directory -Force $dir | Out-Null
    $json = [ordered]@{ gate = 'deploy'; result = 'SKIPPED'; sha = (Get-Sha); reason = $cfg.deployNote; finished = (Get-Date).ToString('s') } | ConvertTo-Json
    Set-Content -LiteralPath (Join-Path $cfg.runsDir 'deploy-latest.json') $json
    Write-Host ('DEPLOY SKIPPED: ' + $cfg.deployNote); exit 0
  }
  exit 0
}
