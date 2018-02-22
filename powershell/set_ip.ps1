# change_ip.ps1
# -------------------------
# Configure the ip address using configurations in config.ps1.  You can also provide a powershell file as a config file, as long as it has:
# $CONFIG_network_adapter -- adapter name ("Ethernet" or "Ethernet 4")
# $CONFIG_network_dhcp_enabled -- $TRUE or $FALSE
# $CONFIG_network_ip_address -- aaa.bbb.ccc.ddd
# $CONFIG_network_subnet_mask -- CIDR notation (8, 16, 24, 32 -- 24 is 255.255.255.0)
# $CONFIG_network_gateway -- aaa.bbb.ccc.ddd
# $CONFIG_network_dns -- aaa.bbb.ccc.ddd (8.8.8.8 is google's DNS server and pretty standard)

param (
[system.io.fileinfo]$config_file = $null
)

# Check for config file -- otherwise use default file
if($config_file -eq $null) {
	. ./settings/config.ps1
}
else {
	. ./$config_file
}

$adapter = Get-NetAdapter -Name $CONFIG_network_adapter
$interface = $adapter | Get-NetIPInterface -AddressFamily IPv4

# Configure DNS
if($CONFIG_network_dhcp_enabled) {
	if ($interface.Dhcp -eq "Disabled") {
		# If currently disabled, remove existing gateway
		if(($interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
			$interface | Remove-NetRoute -Confirm:$false
		}

		# Enable DHCP
		$interface | Set-NetIPInterface -DHCP Enabled

		# Configure the  DNS Servers automatically
		$interface | Set-DnsClientServerAddress -ResetServerAddresses
	}
}
else {
	if(($interface | Get-NetIPConfiguration).Ipv4DefaultGateway) {
		$interface | Remove-NetRoute -Confirm:$false
	}

	$interface | Set-NetIPInterface -DHCP Disabled
}

# Remove any existing IP, gateway from our adapter
if (($adapter | Get-NetIPConfiguration).IPv4Address.IPAddress) {
    $adapter | Remove-NetIPAddress -AddressFamily IPv4 -Confirm:$false
}
if (($adapter | Get-NetIPConfiguration).Ipv4DefaultGateway) {
    $adapter | Remove-NetRoute -AddressFamily IPv4 -Confirm:$false
}

# Add new IP to our adapter
$adapter | New-NetIPAddress -IPAddress $CONFIG_network_ip_address -PrefixLength $CONFIG_network_subnet_mask –DefaultGateway $CONFIG_network_gateway

# Set DNS information
if($CONFIG_network_dns_alt) {
	Set-DnsClientServerAddress -InterfaceAlias $CONFIG_network_adapter -ServerAddresses ($CONFIG_network_dns, $CONFIG_network_dns_alt)
}
else {
	Set-DnsClientServerAddress -InterfaceAlias $CONFIG_network_adapter -ServerAddresses $CONFIG_network_dns
}

Get-NetIPConfiguration