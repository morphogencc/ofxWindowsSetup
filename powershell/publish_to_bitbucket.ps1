# download-from-bitbucket.ps1
# -------------------------
# Downloads an object from bitbucket's downloads page.
#
#

param (
[Parameter(Mandatory=$true)][string]$file
)

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!"
	Write-Host "Please create a file /settings/config.ps1 with parameters $CONFIG_team_name and $CONFIG_project_name."
	exit
}

. ./settings/config.ps1

& 'C:\Program Files\cURL\bin\curl.exe' -v -u $SECRET_username -X POST -L "https://api.bitbucket.org/2.0/repositories/$CONFIG_team_name/$CONFIG_project_name/downloads" -F files=`@$file