# Get printer information to get the printer name
Get-Printer | Format-Table Name, PrinterStatus, ShareName, PortName

# Share the printer and give it a name
Set-Printer -Name "YourPrinterName" -Shared $true -ShareName "Office Printer"

# Publish the printer in the directory
Set-Printer -Name "YourPrinterName" -Published $true

#The below commands are for the computers that need access to this printer

# Define the computer name and printer share name
$computerName = "ComputerNameSharingPrinter"
$printerShareName = "Office Printer"

# Connect to the shared printer
Add-Printer -ConnectionName "\\$computerName\$printerShareName"