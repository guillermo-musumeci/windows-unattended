# This script will create a .CMD file and add it to the Computer Startup
# The script will assume the script will run from same folder of BGInfo
# Update ScriptPath variable if different

# Variables
$BginfoFile = "kopicloud.bgi"
$ScriptPath = $PSScriptRoot

# Create Auto Start File
$Bgfile = $ScriptPath + "\bg.cmd"
$BgScript = "@" + $ScriptPath + "\bginfo.exe " + $ScriptPath + "\" + $bginfoFile + " /timer:0 /nolicprompt"
New-Item $bgfile -force
Set-Content $bgfile $bgscript

# Configure Auto Start
$Destination = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" 
Copy-Item -Path $bgfile -Destination $Destination -force
Write-Host "File '$bgfile' was added to Startup successfully." -ForegroundColor Green
