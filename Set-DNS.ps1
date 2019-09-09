# DNS Variables
$DNS1 = "192.168.56.10"
$DNS2 = "192.168.56.20"
$DNS3 = "192.168.56.30"

# Get Active Network Interface Name
$InterfaceName = Get-NetAdapter -physical | Where-Object status -eq 'up' | Select-Object Name

# Reset existing DNS Settings
Set-DnsClientServerAddress -InterfaceAlias $InterfaceName.Name -ResetServerAddresses

# Set DNS Settings
Set-DnsClientServerAddress -InterfaceAlias $InterfaceName.Name -ServerAddresses ($DNS1, $DNS2, $DNS3)
