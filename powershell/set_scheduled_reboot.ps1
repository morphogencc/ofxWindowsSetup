# set_scheduled_reboot.ps1
# -------------------------
# Create a nightly task that reboots the computer at a given time.

param (
[string]$rebootTime = ""
)

if($rebootTime -eq "") {
	. ./settings/config.ps1
	$rebootTime = $CONFIG_reboot_time
}

$taskName = "Nightly System Reboot"
$task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if (!$task) {
	$action = New-ScheduledTaskAction -Execute "C:\WINDOWS\System32\shutdown.exe -r -f" 
	$trigger = New-ScheduledTaskTrigger -Daily -AT $rebootTime
	$settings = New-ScheduledTaskSettingsSet 
	$inputObject = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings 
	Register-ScheduledTask -TaskName $taskName -InputObject $inputObject 
}