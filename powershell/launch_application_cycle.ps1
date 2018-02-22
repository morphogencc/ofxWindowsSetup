# launch_application.ps1
# -------------------------
# Cyclically starts the program; if the program ever closes then it will automatically reboot.

$path = (Resolve-Path .\).Path

. $path/settings/config.ps1

& $path/$CONFIG_exe_path/$CONFIG_exe_name

#Start-Process PowerShell.exe -arg ./launch_application.ps1 #-WindowStyle Hidden