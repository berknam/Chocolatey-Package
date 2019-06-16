﻿$ErrorActionPreference = 'Stop'

$PackageName = 'x64dbg'
$Url = 'https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_2019-06-16_14-12.zip'
$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition

. $(Join-Path $ToolsPath "StopProcess.ps1")

$packageArgs = @{
    PackageName   = $PackageName
    Url           = $Url
    UnzipLocation = $ToolsPath
}
Install-ChocolateyZipPackage @packageArgs
