#Running this will disable Windows Hello if the option to turn it off is greyed out in Windows

# First, define the registry path and value name
$registryPath = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowSignInOptions"
$valueName = "value"

# Then check if the registry key exists
if (Test-Path $registryPath) {
    # Set the value to 0 to disable Windows Hello
    Set-ItemProperty -Path $registryPath -Name $valueName -Value 0
    Write-Output "Windows Hello has been disabled. Please restart your computer for the changes to take effect."
}
else {
    Write-Output "Registry path not found. Please check the path and try again."
}