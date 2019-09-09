# Unattended Install of Google Chrome

$Installer = $env:TEMP + "\chrome_installer.exe";
Invoke-WebRequest "http://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile $Installer; 
Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
Remove-Item $Installer;
