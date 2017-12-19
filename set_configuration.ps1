Write-Host "Disabling Windows Edge UI and other unnecessary UI..."
./scripts/disable_edge_ui.ps1

Write-Host "Disabling Window Firewall..."
./scripts/disable_firewall.ps1

Write-Host "Disabling Screensaver..."
./scripts/disable_screensaver.ps1

Write-Host "Disabling Windows Update..."
./scripts/disable_windows_update.ps1

Write-Host "Enabling autologin..."
./scripts/enable_autologin.ps1

Write-Host "Setting computer name..."
./scripts/set_computer_name.ps1

Write-Host "Setting IP Address..."
./scripts/set_ip.ps1

Write-Host "Setting power settings..."
./scripts/set_power_settings.ps1

Write-Host "Setting scheduled reboot..."
./scripts/set_scheduled_reboot.ps1

Write-Host "Setting the time zone..."
./scripts/set_timezone.ps1