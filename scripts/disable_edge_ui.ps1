# Disable Edge UI
# -------------------------
# Disables the new Windows Edge UI / other various UI settings

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name DontUsePowerShellOnWinX -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name TaskbarSizeMove -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name OpenAtLogon -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name MonitorOverride -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name MakeAllAppsDefault -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name DesktopFirst -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage' -Name GlobalSearchInApps -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name TaskbarNoMultimon -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate' -Name DisableOSUpgrade -Value 1

# Windows 8
if (Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi') {
}
else {
	New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell' -Name 'EdgeUi'
}

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi' -Name DisableTLCorner -Value 1
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi' -Name DisableTRCorner -Value 1

if (Test-Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent') {
}
else {
	New-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer' -Name 'Accent'
}

Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent' -Name MotionAccentId_v1.00 -Value 000000db

# Windows 10
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name SearchboxTaskbarMode -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name ShowTaskViewButton -Value 0