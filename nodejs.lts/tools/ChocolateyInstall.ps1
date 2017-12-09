﻿$ErrorActionPreference = 'Stop'

$PackageName = 'nodejs'
$Url32 = 'https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-win-x86.7z'
$Checksum32 = 'e23102d8555eace48b9976a490f3a5b702a74eff7184cdd99b7dc2e1b8d22fcb'
$ChecksumType32 = 'SHA256'
$Url64 = 'https://npm.taobao.org/mirrors/node/v8.9.3/node-v8.9.3-win-x64.7z'
$Checksum64 = 'd67bea0d8e27e66b55bdc32de600a11611e73b3a2322401a487513e56304559c'
$ChecksumType64 = 'SHA256'
$InstallationPath = Get-ToolsLocation
$ToolsPath = Join-Path $(Get-ToolsLocation) $PackageName

$PackageArgs = @{
    PackageName    = $PackageName
    Url            = $Url32
    Checksum       = $Checksum32
    ChecksumType   = $ChecksumType32
    Url64          = $Url64
    Checksum64     = $Checksum64
    ChecksumType64 = $ChecksumType64
    UnzipLocation  = $InstallationPath
}
Install-ChocolateyZipPackage @PackageArgs

if (-Not (Test-Path $ToolsPath)) {
    New-Item -ItemType Directory -Force -Path $ToolsPath
}
$UnzipPath = (Get-ChildItem $InstallationPath -Directory | Where-Object Name -Like "node-v*-win-x*" | Select-Object -First 1).FullName
cmd /c xcopy $UnzipPath $ToolsPath /s /y /q
cmd /c rmdir "$UnzipPath" /s /q

Install-ChocolateyPath -PathToInstall $ToolsPath -PathType 'Machine'
