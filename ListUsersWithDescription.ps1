#ListUsersWithDescription.ps1
Import-Module ActiveDirectory

Get-ADUser -Filter * -Property Description | 
    Select-Object Name, Description | 
    Export-Csv -Path "UserDescriptions.csv" -NoTypeInformation

Write-Host "La liste des utilisateurs avec descriptions a été exportée vers 'UserDescriptions.csv'."