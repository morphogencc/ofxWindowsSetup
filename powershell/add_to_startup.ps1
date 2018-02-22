# add_to_startup.ps1
# -------------------------
# Creates a shortcut for launch_application.ps1 and places it in the startup folder.
#

if(!(Test-Path ./settings/config.ps1)) {
	Write-Host ""
	Write-Host "Could not find configuration file!"
	Write-Host "Please create a file /settings/config.ps1 with parameters $CONFIG_team_name and $CONFIG_project_name."
	exit
}

. ./settings/config.ps1

$path = (Resolve-Path "$CONFIG_exe_path/$CONFIG_exe_name").Path
Write-Host $path
Write-Host ""
# Set-Content startup.cmd "PowerShell -File `"$path\launch_application_cycle.ps1`""

$target = "$path"
$shortcut_path = "$((Resolve-Path "$CONFIG_exe_path").Path)/startup.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($shortcut_path)
$shortcut.TargetPath = $target
$shortcut.WorkingDirectory = $path
$shortcut.Save()

Move-Item $CONFIG_exe_path/startup.lnk "C:\Users\sdf\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -force