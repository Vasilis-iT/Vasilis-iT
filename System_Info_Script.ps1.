PowerShell

# ==========================================
# Simple System Information Collector Script
# Author: Vasileios Ganotis
# ==========================================

Write-Host "Gathering system details..." -ForegroundColor Green

# Get OS and Computer Name
Get-ComputerInfo | Select-Object OsName, CsName, CsProcessors, CsTotalPhysicalMemory

# Get IP Configuration
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -ne "Loopback Pseudo-Interface 1"} | Select-Object InterfaceAlias, IPAddress

Write-Host "Done!" -ForegroundColor Green
