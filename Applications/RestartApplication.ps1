# Enter the executable file name (without .exe)
$exeName = "EXECUTABLE_NAME"
$partialMatch = "*$exeName*"

$runningProcesses = Get-Process | Where-Object { $_.ProcessName -like $partialMatch }

if ($runningProcesses) {
    # Close all processes associated with the application
    $runningProcesses | ForEach-Object { Stop-Process -Id $_.Id -Force }
    Write-Host "Application '$exeName' closed."
} else {
    Write-Host "Application '$exeName' is not running."
}

#Enter the path of the executable (ex: c:\users\username|desktop\textfile.txt)
Start-Process -FilePath "FULL_PATH_OF_EXCECUTABLE" -PassThru
Write-Host "Application '$exeName' started."

#Enter the path of a notepad file here, this will be used for logging
$notepadFilePath = "NOTEPAD_LOCATION"

if (Test-Path $notepadFilePath) {
    $timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "Caffeine started successfully at $timeStamp" | Out-File -FilePath $notepadFilePath -Append
    Write-Host "Successfully wrote to Notepad file."
} else {
    Write-Host "Notepad file not found at '$notepadFilePath'."
}