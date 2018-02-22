# set_admin_username.ps1
# -------------------------
# Changes the current admin user/pass to a new set.

param (
[Parameter(Mandatory=$true)][string]$username = $null,
[Parameter(Mandatory=$true)][string]$password = $null
)

$oldAdminuserName = "sdf" # change this if necessary

if(([Environment]::UserName -eq $oldAdminUserName) -and ([Environment]::UserName -ne $username)) {
	$adminUser = [ADSI]"WinNT://./$oldAdminUserName,user"
	$adminUser.psbase.rename($username)
	$adminUser.SetPassword($password)
	$adminUser.setInfo()
}