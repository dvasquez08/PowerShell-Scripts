# Ask for the -user email address (the person that needs access)
$userEmail = Read-Host "Please enter the email address of the user that requires access"

# Ask for the -identity email address (the target email address)
$identityEmail = Read-Host "Please enter the target email address"

# Connect to Exchange
Connect-ExchangeOnline

# Applying the changes with the provided email addresses
Add-MailboxPermission -Identity $identityEmail -User $userEmail -AccessRights FullAccess -AutoMapping $false