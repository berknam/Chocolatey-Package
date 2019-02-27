﻿$ErrorActionPreference = 'Stop'

$PackageName = 'git'
$Url32 = 'https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/PortableGit-2.21.0-32-bit.7z.exe'
$Url64 = 'https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/PortableGit-2.21.0-64-bit.7z.exe'
$ToolsPath = Join-Path $(Get-ToolsLocation) $packageName

$packageArgs = @{
    PackageName   = $PackageName
    Url           = $Url32
    Url64         = $Url64
    UnzipLocation = $ToolsPath
}
Install-ChocolateyZipPackage @packageArgs

$BinPath = Join-Path $ToolsPath "cmd"
Install-ChocolateyPath -PathToInstall $BinPath -PathType 'Machine'
