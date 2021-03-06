﻿$ErrorActionPreference = 'Stop'

$PackageName = 'mkvtoolnix'
$Url32 = 'https://mkvtoolnix.download/windows/releases/42.0.0/mkvtoolnix-32-bit-42.0.0.7z'
$Url64 = 'https://mkvtoolnix.download/windows/releases/42.0.0/mkvtoolnix-64-bit-42.0.0.7z'
$Checksum32 = 'e072fee1c28a376d700db7daf3adfa6a7455dd50'
$ChecksumType32 = 'sha1'
$Checksum64 = '4627ce3bd9d75047c9e5ad54683c6313025e02a3'
$ChecksumType64 = 'sha1'
$ToolsPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$PackageArgs = @{
    PackageName    = $PackageName
    url            = $Url32
    Checksum       = $Checksum32
    ChecksumType   = $ChecksumType32
    url64          = $Url64
    Checksum64     = $Checksum64
    ChecksumType64 = $ChecksumType64
    UnzipLocation  = $ToolsPath
}
Install-ChocolateyZipPackage @PackageArgs
