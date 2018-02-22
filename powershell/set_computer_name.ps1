# set_computer_name.ps1
# -------------------------
# Renames the computer.
param (
[string]$computername = $null
)

if ($computername -eq $null) {
	. ./settings/config.ps1
	$computername = $CONFIG_computer_name
}

Rename-Computer $computername