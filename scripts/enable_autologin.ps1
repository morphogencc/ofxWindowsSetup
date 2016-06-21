# enable_autologin.ps1
# -------------------------
# Enables automatic login without a username and password; either place the username and password in the configuration file or run this
# in the powershell and enter them manually.

param (
[string]$username = "",
[string]$password = ""
)

if($username -eq "") {
	. ./settings/config.ps1
	$username = $CONFIG_admin_username
	$password = $CONFIG_admin_password
}

# Autologin
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoAdminLogon -Value 1
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultDomainName -Value $env:computername
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultUserName -Value $username
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultPassword -Value $password
