Import-Module ActiveDirectory

function Prompt-UserInput {
    param (
        [string]$PromptText
    )
    Read-Host -Prompt $PromptText
}

$FirstName = Prompt-UserInput "Enter first name"
$LastName = Prompt-UserInput "Enter last name"
$JobTitle = Prompt-UserInput "Enter job title"
$Department = Prompt-UserInput "Enter department name"
$Manager = Prompt-UserInput "Enter manager's username"
$Location = Prompt-UserInput "Enter branch location"
$EmployeeID = Prompt-UserInput "Enter Employee ID"
$Password = Prompt-UserInput "Enter password"

$LocationOU = "OU=$Location,OU=Users,DC=Contoso,DC=com"
$OUExists = Get-ADOrganizationalUnit -Filter { DistinguishedName -eq $LocationOU } -ErrorAction SilentlyContinue

if (-not $OUExists) {
    Write-Host "Cannot find location, please make sure location entered is correct" -ForegroundColor Red
    exit
}

$SamAccountName = $FirstName.Substring(0, 1) + $LastName
$DisplayName = "$FirstName $LastName"

New-ADUser `
    -SamAccountName $SamAccountName `
    -UserPrincipalName $SamAccountName@AFDPetroleum.com `
    -Name $DisplayName `
    -GivenName $FirstName `
    -Surname $LastName `
    -DisplayName $DisplayName `
    -Title $JobTitle `
    -Department $Department `
    -Manager (Get-ADUser -Identity $Manager).DistinguishedName `
    -EmployeeID $EmployeeID `
    -Path $LocationOU `
    -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) `
    -Enabled $true `
    -PassThru

Set-ADUser -Identity $SamAccountName -SamAccountName $SamAccountName

Set-ADUser -Identity $SamAccountName -Replace @{extensionAttribute15 = $AssociateID }

Write-Host "User account for $DisplayName created successfully"