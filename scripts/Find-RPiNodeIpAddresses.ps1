# Finds Raspberry Pi IP Addresses on network
# searches for known MAC prefix
# https://maclookup.app/macaddress/DCA632

# Vars
$macPrefix = "dc-a6-32"

$taskMessage = "Searching ARP table"
Write-Host "STARTED: $taskMessage"

# Search arp table for MAC prefix
Write-Host "Search ARP table"
arp -a | Select-String $macPrefix

Write-Host "FINISHED: $taskMessage"
