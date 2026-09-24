PowerShell

Get-ComputerInfo | Select-Object CsName, OsName
Get-NetIPAddress | Where-Object {$_.AddressFamily -eq "IPv4"} | Select-Object InterfaceAli
