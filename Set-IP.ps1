# Configure IP Address, Subnet & Gateway in Windows using PowerShell

# Variables
$IPAddress = "192.168.56.135"
$IPSubnetPrefix = "24"
$IPGateway = "192.168.56.1"

# Get Active Network Interface Name
$InterfaceName = Get-NetAdapter -physical | Where-Object status -eq 'up' | Select-Object Name

# Reset Network Settings
Remove-NetRoute -DestinationPrefix "0.0.0.0/0" -Confirm:$false
Get-NetIPAddress -InterfaceAlias $InterfaceName.Name | Remove-NetIpAddress  -Confirm:$false

# Set Network Settings
New-NetIpAddress `
-InterfaceAlias $InterfaceName.Name `
-IpAddress $IPAddress `
-PrefixLength $IPSubnetPrefix `
-DefaultGateway $IPGateway
