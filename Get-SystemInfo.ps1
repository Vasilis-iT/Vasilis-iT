PowerShell

# ==========================================
# Simple System Information Script
# Author: Vasilis
# Description: Gathers basic OS and hardware info
# ==========================================

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "         SYSTEM INFORMATION CHECK         " -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Cyan

# Get Operating System Info
$OS = Get-CimInstance Win32_OperatingSystem
Write-Host "[*] Operating System: " -NoNewline; Write-Host $OS.Caption -ForegroundColor Green
Write-Host "[*] Architecture:     " -NoNewline; Write-Host $OS.OSArchitecture -ForegroundColor Green
Write-Host "[*] Version:          " -NoNewline; Write-Host $OS.Version -ForegroundColor Green

# Get Computer & User Info
Write-Host "[*] Computer Name:    " -NoNewline; Write-Host $env:COMPUTERNAME -ForegroundColor Green
Write-Host "[*] Current User:     " -NoNewline; Write-Host $env:USERNAME -ForegroundColor Green

# Get RAM Info
$TotalRAM = [math]::Round($OS.TotalVisibleMemorySize / 1MB, 2)
$FreeRAM  = [math]::Round($OS.FreePhysicalMemory / 1MB, 2)
Write-Host "[*] Total RAM:        " -NoNewline; Write-Host "$TotalRAM GB" -ForegroundColor Green
Write-Host "[*] Free RAM:         " -NoNewline; Write-Host "$FreeRAM GB" -ForegroundColor Green

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Script executed successfully!" -ForegroundColor Cyan
