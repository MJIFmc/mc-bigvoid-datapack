# 构建：dist\threebody-bigvoid.zip 与 dist\threebody-bigvoid-name-resourcepack.zip
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
New-Item -ItemType Directory -Force -Path dist | Out-Null

$zip = Join-Path (Get-Location) "dist\threebody-bigvoid.zip"
if (Test-Path $zip) { Remove-Item $zip }
Compress-Archive -Path pack.mcmeta, data -DestinationPath $zip

$rp = Join-Path (Get-Location) "dist\threebody-bigvoid-name-resourcepack.zip"
if (Test-Path $rp) { Remove-Item $rp }
Push-Location optional\name-resourcepack
Compress-Archive -Path pack.mcmeta, assets -DestinationPath $rp
Pop-Location

Write-Host "built $zip"
Write-Host "built $rp"
