# disable_firewall.ps1
# -------------------------
# Disables the Windows Firewall.

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
