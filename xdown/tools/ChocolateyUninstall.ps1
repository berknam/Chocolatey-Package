﻿$PackageName = 'XDown'
$InstallationPath = Join-Path $(Get-ToolsLocation) $PackageName.ToLower()

Remove-Item $InstallationPath -Recurse -Force -ErrorAction Ignore
Uninstall-BinFile -Name "${PackageName}"

$LinkPath = Join-Path $([Environment]::GetFolderPath("CommonDesktopDirectory")) "${PackageName}.lnk"
Remove-Item $LinkPath -Force -ErrorAction Ignore