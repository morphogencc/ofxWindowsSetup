# download-from-bitbucket.ps1
# -------------------------
# Downloads an object from bitbucket's downloads page.
#
#

param (
[Parameter(Mandatory=$true)][string]$folder
)

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!  Please verify that it exists at config.ps1"
	exit
}

. ./settings/config.ps1

& ./download_from_bitbucket.ps1 "$folder.tar.gz"

& ./7za.exe e ./$folder.tar.gz 
& ./7za.exe x -aoa -ttar ./$folder.tar

Remove-Item ./$folder.tar
Remove-Item ./$folder.tar.gz