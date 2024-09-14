# Define the distinguished names (DN) of the managers
$oldManagerDN = "CN=NAME,OU=PLACEHOLDER,OU=PLACEHOLDER,DC=DOMAIN,DC=com"
$newManagerDN = "CN=NAME,OU=PLACEHOLDER,OU=PLACEHOLDER,DC=DOMAIN,DC=com"

# Get all users under the old manager
$users = Get-ADUser -Filter {Manager -eq $oldManagerDN}

# Loop through each user and update their manager to the new manager

foreach ($user in $users) {
    Set-ADUser -Identity $user -Manager $newManagerDN
    Write-Host "Updated manager for user: $($user.SamACcountName)"
}

