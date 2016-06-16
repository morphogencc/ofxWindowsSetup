# package_new_release.ps1
# -------------------------
# Packages the latest compiled Release from your current computer, ready to deploy on a remote computer.

param (
[Parameter(Mandatory=$true)][string]$folder,
[Parameter(Mandatory=$true)][string]$archive_name
)

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!  Please verify that it exists at config.ps1"
	exit
}

. ./settings/config.ps1

# Zip it up
& 7z.exe a -ttar ./$archive_name.tar ./$folder
& 7z.exe a ./$archive_name.tar.gz ./$archive_name.tar

& ./publish_to_bitbucket.ps1 ./$archive_name.tar.gz
