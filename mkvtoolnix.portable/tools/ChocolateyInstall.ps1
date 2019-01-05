﻿$ErrorActionPreference = 'Stop'

$PackageName = 'mkvtoolnix'
$Url32 = 'https://mkvtoolnix.download/windows/releases/30.0.0/mkvtoolnix-32-bit-30.0.0.7z'
$Url64 = 'https://mkvtoolnix.download/windows/releases/30.0.0/mkvtoolnix-64-bit-30.0.0.7z'
$Checksum32 = '6ba0e0112f9541f46ed64a89f98a2212e0f192d1'
$ChecksumType32 = 'sha1'
$Checksum64 = '965504da41d29e25def960f934a6c20824b9127b'
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
