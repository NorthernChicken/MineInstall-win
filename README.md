# MineInstall-win
This is a Windows port, re-written from the ground up, of a previous project of mine that installs a Minecraft server using Bash. Because not everyone uses Linux, I have created a Windows version.
Original repo: https://github.com/NorthernChicken/MineInstall

# Requirements
* Requires git: https://git-scm.com/download/win
* Requires Java 17 or higher: https://www.oracle.com/java/technologies/downloads/#jdk17-windows
* Requires PowerShell (pre-installed with Windows)
* Windows Terminal is recommended, but not required: https://www.microsoft.com/store/productId/9N0DX20HK701?ocid=pdpshare

# Download and Install
1. Open powershell as administrator (start menu -> type "powershell" and run as administrator)
2. Download this repository with git: ```git clone https://github.com/NorthernChicken/MineInstall-win```
3. Change to the directory: ```cd MineInstall-win```
4. Run the batchfile: ```.\run.bat```
5. Once the script is finished, navigate to the server directory: ```cd ~\server```
6. You can start the server by running ```.\start.ps1```. Enter how much memory you would like to allocate to the server in Megabytes.

# Uninstall
Navigate to your server directory: ```cd C:\Users\<YOUR USERNAME>\server```
Run the uninstall script: ```.\uninstall.ps1``` WARNING: THIS WILL DELETE YOUR SERVER, ITS WORLD, AND ALL PLAYER DATA. RUN AT YOUR OWN RISK.

# Troubleshooting
If you ever get an error related to "execution policy," you may need to change this setting:
1. Open PowerShell (start menu -> search "PowerShell" and run as administrator)
2. Run: ```Set-ExecutionPolicy Unrestricted -Scope CurrentUser```
*Note that this will allow for the execution of any script on your computer. If you want to turn this off later, run: ```Set-ExecutionPolicy Restricted -Scope CurrentUser```.
