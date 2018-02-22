# disable_screensaver.ps1
# -------------------------
# Disables the screensaver from ever turning on.

# Disable screensaver
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name ScreenSaveActive -Value 1
