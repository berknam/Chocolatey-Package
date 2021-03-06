﻿Import-Module AU

function global:au_SearchReplace {
	@{
		'tools\ChocolateyInstall.ps1' = @{
			"(^[$]Checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
			"(^[$]ChecksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
		}
	}
}

function global:au_GetLatest {
	$page = Invoke-WebRequest -UseBasicParsing -Uri "http://www.torchsoft.com/node/12"
	$version = $page.Content -split "\s" -match "^\d+(\.\d+){2}$" | Select-Object -First 1

	return @{
		Version = $version
	}
}

Update-Package -NoCheckChocoVersion -ChecksumFor none
