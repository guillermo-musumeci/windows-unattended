# Unattended Install of Visual Studio Code

$channel = 'stable'
$platform = 'win32-x64-user' 
$SourceURL = "https://vscode-update.azurewebsites.net/latest/$platform/$channel";
$Installer = $env:TEMP + "\vscode.exe"; 
Invoke-WebRequest $SourceURL -OutFile $Installer;
Start-Process -FilePath $Installer -Args "/verysilent /tasks=addcontextmenufiles,addcontextmenufolders,addtopath" -Wait; 
Remove-Item $Installer;
Stop-Process -Name Explorer
