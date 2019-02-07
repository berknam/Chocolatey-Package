﻿$ErrorActionPreference = 'Stop'

$PackageName = 'InkScape'
$Url32 = 'https://inkscape.org/gallery/item/13320/inkscape-0.92.4-x86.7z'
$Url64 = 'https://inkscape.org/gallery/item/13317/inkscape-0.92.4-x64.7z'
$Checksum32 = '53f83d74161cbf19d6b7fb71a4f1f521'
$Checksum64 = '538ad141d9ff9a743890389f41c4be33'
$ChecksumType32 = 'md5'
$ChecksumType64 = 'md5'
$InstallationPath = Join-Path $(Get-ToolsLocation) $PackageName
$UnzipLocation = Get-ToolsLocation

$PackageArgs = @{
    PackageName    = $PackageName
    Url            = $Url32
    Checksum       = $Checksum32
    ChecksumType   = $ChecksumType32
    Url64          = $Url64
    Checksum64     = $Checksum64 
    ChecksumType64 = $ChecksumType64
    UnzipLocation  = $UnzipLocation
}
Install-ChocolateyZipPackage @packageArgs

$BinFileName = Join-Path $InstallationPath "$PackageName.exe"
Install-BinFile -Name $PackageName -Path $BinFileName
$LinkPath = Join-Path $([Environment]::GetFolderPath("CommonDesktopDirectory")) "${PackageName}.lnk"
Install-ChocolateyShortcut -ShortcutFilePath $LinkPath -TargetPath $BinFileName -WorkingDirectory $InstallationPath

