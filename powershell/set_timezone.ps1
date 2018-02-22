# set_timezone.ps1
# -------------------------
# Sets the timezone, and a time-resync with internet servers on every user logon.

. ./settings/config.ps1

& "$env:windir\system32\tzutil.exe" /s $CONFIG_timezone

$taskName1 = "Resync Time 1-2"
$task1 = Get-ScheduledTask -TaskName $taskName1 -ErrorAction SilentlyContinue

if (!$task1) {
	$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\sc.exe" -Argument "start w32time task_started" 
	$trigger = New-ScheduledTaskTrigger -AtLogOn
	$settings = New-ScheduledTaskSettingsSet
	$principal = New-ScheduledTaskPrincipal -UserId "$($env:USERDOMAIN)\$($env:USERNAME)" -LogonType ServiceAccount -RunLevel Highest
	Register-ScheduledTask -TaskName $taskName1 -Description "Synchronize time at startup." -Action $action -Trigger $trigger -Settings $settings -Principal $principal
}

$taskName = "Resync Time 2-2"
$task = Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue

if (!$task) {
	$action = New-ScheduledTaskAction -Execute "C:\Windows\System32\w32tm.exe" -Argument "/resync" 
	$trigger = New-ScheduledTaskTrigger -AtLogOn
	$settings = New-ScheduledTaskSettingsSet
	$principal = New-ScheduledTaskPrincipal -UserId "$($env:USERDOMAIN)\$($env:USERNAME)" -LogonType ServiceAccount -RunLevel Highest
	Register-ScheduledTask -TaskName $taskName -Description "Synchronize time at startup." -Action $action -Trigger $trigger -Settings $settings -Principal $principal
}