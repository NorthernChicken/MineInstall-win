# -------------------------------
# MineInstall-win
# Installs a Minecraft server onto your Windows PC/Server using PowerShell.
# Made by NorthernChicken: https://github.com/NorthernChicken
# Note: this is a Windows port of a Bash script I made for Linux/Unix: https://github.com/NorthernChicken/MineInstall
# Repo: https://github.com/NorthernChicken/MineInstall-win
# -------------------------------

$server_version = "1.20.4"
$server_link = "https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar"

$java_installed = $false
$username = $env:USERNAME
$server_directory = "C:\Users\$username\server"
$eula = "eula=true"

Copy-Item -Path start.ps1 -Destination "C:\Users\$username"
Copy-Item -Path uninstall.ps1 -Destination "C:\Users\$username"

# Check if Java is installed
function check_java {
    $global:java_installed = $false
    Write-Host "Checking Java..."
    $javaPath = Get-Command java -ErrorAction SilentlyContinue

    if ($javaPath) {
        $global:java_installed = $true
        Write-Host "Java is installed. Java path: $($javaPath.Source)"
    } else {
        Write-Host "Java is not installed."
    }
}
check_java

function transfer_config_files {
    $global:username = = $env:USERNAME
    Copy-Item -Path C:\Users\$username\start.ps1 -Destination $server_directory
    Remove-Item -Path C:\Users\$username\start.ps1
    Copy-Item -Path C:\Users\$username\uninstall.ps1 -Destination $server_directory
    Remove-Item -Path C:\Users\$username\uninstall.ps1
}

# Download the server.jar file from Mojang's official servers
function server_download {
    if (Test-Path -Path $server_directory -PathType Container) {
        Write-Host "Erasing contents of $server_directory."
        Remove-Item -Recurse -Force -Path $server_directory -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 5
        New-Item -ItemType Directory -Path $server_directory        
        transfer_config_files
        Set-Location $server_directory
        Write-Host "Downloading server.jar for Minecraft $server_version..."
        Invoke-WebRequest -Uri $server_link -OutFile "server.jar"
        if ($?) {
            Write-Host "Download successful."
        } else {
            Write-Host "Download failed. Check your internet connection and try again."
            Exit
        }
    } else {
        Write-Host "Creating proper directories..."
        New-Item -ItemType Directory -Path $server_directory
        transfer_config_files
        Set-Location $server_directory
        Write-Host "Downloading server.jar..."
        Invoke-WebRequest -Uri $server_link -OutFile "server.jar"
        if ($?) {
            Write-Host "Download successful."
        } else {
            Write-Host "Download failed. Check your internet connection and try again."
            Exit
        }
    }
}
if ($java_installed) {
    server_download
}

# Set up the server and accept the EULA
function server_setup {
    Set-Location $server_directory
    Write-Host "Running server.jar..."
    Start-Process -FilePath "java" -ArgumentList ("-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui") -NoNewWindow -Wait
    Write-Host "Accepting EULA..."
    Out-File -FilePath "$server_directory\eula.txt" -InputObject $eula
    Write-Host "Creating server..."
}
if ($java_installed) {
    server_setup
}
