# package_new_release.ps1
# -------------------------
# Packages the latest compiled Release from your current computer, ready to deploy on a remote computer.

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!  Please verify that it exists at config.ps1"
	exit
}

. ./settings/config.ps1

# Copy executable
# Copy-Item ${CONFIG_release_path}/${CONFIG_exe_name} $CONFIG_exe_path

# Archive the release into a folder.
& ./archive_executable.ps1

$dir_name = "$((Get-Date).ToString('yyyy-MM-dd'))"

# Zip it up
& ./7za.exe a -ttar ./$dir_name.tar $CONFIG_exe_path/$dir_name
& ./7za.exe a ./$dir_name.tar.gz ./$dir_name.tar

& ./publish_to_bitbucket.ps1 ./$dir_name.tar.gz

Remove-Item ./$dir_name.tar
Remove-Item ./$dir_name.tar.gz
