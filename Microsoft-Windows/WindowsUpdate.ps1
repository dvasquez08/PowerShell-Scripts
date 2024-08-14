Install-Module PSWindowsUpdate

Get-WindowsUpdate

Install-WindowsUpdate -AcceptAll -IgnoreRebootRequired

Write-Output "Windows Update Complete"