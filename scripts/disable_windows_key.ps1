# disable_windows_key.ps1
# -------------------------
# Disables the windows keys.  To enable them, go into the registry editor and remove the Scancode Map key in the directory below.

Set-Property -path 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout\' -name 'Scancode Map' -propertytype REG_BINARY -value 00000000000000000300000000005BE000005CE000000000