﻿$ErrorActionPreference = 'Stop'

$PackageName = 'x64dbg'
$Url = 'https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_2018-03-06_00-01.zip'
$ToolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    PackageName   = $PackageName
    Url           = $Url
    Url64         = $Url
    UnzipLocation = $ToolsPath
}
Install-ChocolateyZipPackage @packageArgs
