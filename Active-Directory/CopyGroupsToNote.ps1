#Use this below script to copy the grup membership of an AD user to a notepad so you can save as a reference 

Get-ADPrincipalGroupMembership -Identity USERNAME | Select-Object Name | Out-File -Filepath "PATH_TO_NOTEPAD"

#Replace USERNAME with the AD username
#Replace "PATH_TO_NOTEPAD" with the UNC of the text document you're copying this list to