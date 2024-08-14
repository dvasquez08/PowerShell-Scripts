# Prompt for the target account (user you are copying from) and user account (user that you are copying to)
$targetAccount = Read-Host -Prompt "Enter the username of the account to copy from"
$userAccount = Read-Host -Prompt "Enter the username of the account to copy to"

try {
    # Get display names of the target and user accounts, this is for the output at the end when copy is complete
    $targetDisplayName = (Get-ADUser -Identity $targetAccount -Properties DisplayName).DisplayName
    $userDisplayName = (Get-ADUser -Identity $userAccount -Properties DisplayName).DisplayName

    # Copy group membership from target account to user account
    Get-ADUser -Identity $targetAccount -Properties memberof | Select-Object -ExpandProperty memberof | ForEach-Object { Add-ADGroupMember -Identity $_ -Members $userAccount }

    # Verify that the user's account is added to the desired groups
    Get-ADUser -Identity $userAccount -Properties memberof

    # Display completion message
    Write-Output "Groups copied from $targetDisplayName to $userDisplayName"
}
catch {

    #The error message that is shown if the copy does not work, followed by the reason for the error
    Write-Error "An error occurred, copy not complete: $_"
}

