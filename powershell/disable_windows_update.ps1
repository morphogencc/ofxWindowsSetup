# disable_windows_update.ps1
# -------------------------
# Configure Windows Update to never check for updates, and never bother the user to update.

if ([environment]::OSVersion.Version.Major -lt 10) {
	$update_settings = (New-Object -com "Microsoft.Update.AutoUpdate").Settings
	# 0 is not configured, 1 is disabled, 2 is notify before download, 3 is notify before installation, 4 is fully automatic
	$update_settings.NotificationLevel = 1
	$update_settings.Save()
}

if ([environment]::OSVersion.Version.Major -eq 10) {
	if(!(Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate')) {
		New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows\' -Name 'WindowsUpdate'
	}

	if(!(Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU')) {
		New-Item -Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -Name 'AU'
	}
	
	Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -Name "NoAutoUpdate" -Value 1
}
