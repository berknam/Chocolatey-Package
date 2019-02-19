﻿$ErrorActionPreference = 'Stop'

$PackageName = 'hxd'
$Url32 = 'https://mh-nexus.de/downloads/HxDSetup.zip'
$Checksum32 = '5da818e69c46a12df01a1901f2807e51377ed742'
$ChecksumType32 = 'SHA1'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$PackageArgs = @{
    PackageName   = $PackageName
    Url           = $Url32
    Checksum      = $Checksum32
    ChecksumType  = $ChecksumType32
    UnzipLocation = $ToolsPath
}
Install-ChocolateyZipPackage @PackageArgs

$SetupPath = (Get-ChildItem -Path $ToolsPath -Filter "*Setup.exe" | Select-Object -First 1).FullName
$SetupInfPath = Join-Path $ToolsPath 'setup.inf'
(Get-Content $SetupInfPath).Replace('[InstallationPath]', $ToolsPath) | Set-Content $SetupInfPath
$SilentArgs = "/verysilent /norestart /LoadInf=`"$SetupInfPath`""

$PackageArgs = @{
    PackageName  = $PackageName
    Url          = $SetupPath
    SilentArgs   = $SilentArgs
}
Install-ChocolateyPackage @PackageArgs

Remove-Item $SetupPath -Force -ErrorAction Ignore
Get-ChildItem $ToolsPath -File -Include "unins*.exe" -Recurse | ForEach-Object { $null = New-Item "$($_.FullName).ignore" -Type File -Force }
