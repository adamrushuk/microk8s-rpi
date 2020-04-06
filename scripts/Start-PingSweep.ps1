# Starts a fast ping sweep of network

# Vars
$networkPrefix = "192.168.1"

$taskMessage = "Ping Sweep"
Write-Host "STARTED: $taskMessage"

# Ping sweep to fill the Arp table
$ips = 1..255 | ForEach-Object {"$($networkPrefix).$_"};$t=$ips|ForEach-Object{(New-Object Net.NetworkInformation.Ping).SendPingAsync($_,250)};[Threading.Tasks.Task]::WaitAll($t);$t.Result | Select-Object Address, Status, RoundtripTime | ForEach-Object{ if($_.Status -eq "Success") {$_}}

Write-Host "FINISHED: $taskMessage"
