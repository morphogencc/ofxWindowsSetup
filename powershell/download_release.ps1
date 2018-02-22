# unpackage_new_release.ps1
# -------------------------
# Unpackages the latest compiled Release from bitbucket to your computer.

param (
[string]$file = "$((Get-Date).ToString('yyyy-MM-dd')).tar.gz"
)

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!  Please verify that it exists at config.ps1"
	exit
}

. ./settings/config.ps1

& ./download_from_bitbucket.ps1 $file

$dir_name = "$((Get-Date).ToString('yyyy-MM-dd'))"

& ./7za.exe e ./$dir_name.tar.gz 
& ./7za.exe x -aoa -ttar ./$dir_name.tar

Remove-Item ./$dir_name.tar
Remove-Item ./$dir_name.tar.gz

if(Test-Path $CONFIG_exe_path/$dir_name) {
	Remove-Item $CONFIG_exe_path/$dir_name
}

Move-Item ./$dir_name $CONFIG_exe_path/ -force

Copy-Item $CONFIG_exe_path/$dir_name/$CONFIG_exe_name $CONFIG_exe_path/$CONFIG_exe_name -force

& ./add_to_startup.ps1