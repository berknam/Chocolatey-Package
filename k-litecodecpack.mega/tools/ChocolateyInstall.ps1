﻿$ErrorActionPreference = 'Stop'

$PackageName = 'k-litecodecpack.mega'
$Url32 = 'http://files2.codecguide.com/K-Lite_Codec_Pack_1375_Mega.exe'
$Checksum32 = 'caf68286d2fb66e7f2b857a2f98fdd0a2083abe822eb1ecb9675cfeeee065f53'
$ChecksumType32 = 'SHA256'

$PackageArgs = @{
    InstallerType = 'EXE'
    PackageName   = $PackageName
    Url           = $Url32
    Checksum      = $Checksum32
    ChecksumType  = $ChecksumType32
    SilentArgs    = '/VERYSILENT'
}
Install-ChocolateyPackage @PackageArgs