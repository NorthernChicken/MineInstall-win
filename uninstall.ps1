# Run this script to uninstall the Minecraft server and delete any associated files.
# WARNING: THIS WILL DELETE YOUR SERVER, ITS WORLD, AND ALL PLAYER DATA. RUN AT YOUR OWN RISK.

$username = $env:USERNAME
$server_directory = "C:\Users\$username\server"
$isTrue = $false

while ($isTrue -eq $false) {
    $response = Read-Host -Prompt "Do you want to continue? Keep in mind that this will delete your server, its world, and all player data. (y/n)"

    if ($response -eq "y" -or $response -eq "Y") {
        $isTrue = $true
    }
    elseif ($response -eq "n" -or $response -eq "N") {
        $isTrue = $false
    }
    else {
        Write-Host "Invalid input. Please enter 'y' or 'n'."
    }
}

if ($isTrue -eq $true) {
    Set-Location -Path "C:\Users\$username"
    Remove-Item -Recurse -Force $server_directory
}
else {
    Write-Host "Uninstallation aborted."
}
