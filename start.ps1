#Run this script to start the server.

#Shows amount of installed memory
$freeMemory = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
Write-Host "You have $freeMemory MB of RAM available."
$userAllocated = Read-Host "How much would you like to allocate to the server? "
$userAllocated += "M"

Start-Process -FilePath "java" -ArgumentList ("-Xmx$userAllocated", "-Xms$userAllocated", "-jar", "server.jar", "nogui") -NoNewWindow -Wait
