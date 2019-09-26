# Configure Time Zone and NTP server

# Variables
$TimeZone = "Romance Standard Time"
$NTPServer = "ntp.inditex.play"

# Configure NTP and restart service
Set-TimeZone -Id $TimeZone -PassThru
Push-Location
Set-Location HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers
Set-ItemProperty . 0 $NTPServer
Set-ItemProperty . "(Default)" "0"
Set-Location HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Parameters
Set-ItemProperty . NtpServer $NTPServer
Pop-Location
Stop-Service w32time
Start-Service w32time
