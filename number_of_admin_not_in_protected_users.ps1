## Number of admins not in Protected Users
# Importer le module Active Directory
Import-Module ActiveDirectory

# Identifier le groupe "Protected Users"
$protectedUsersGroup = Get-ADGroup "Protected Users"

# Rechercher tous les comptes d'administrateurs
$adminAccounts = Get-ADGroupMember 'Administrators' -recursive | where { $_.objectClass -eq 'user' }

# Parcourir chaque compte d'administrateur
foreach ($account in $adminAccounts) {
    # Vérifier si le compte est déjà dans le groupe "Protected Users"
    $isProtected = Get-ADGroupMember $protectedUsersGroup | where { $_.SamAccountName -eq $account.SamAccountName }
    
    if (-not $isProtected) {
        # Ajouter le compte au groupe "Protected Users"
        Add-ADGroupMember -Identity $protectedUsersGroup -Members $account
        Write-Host "Le compte $($account.SamAccountName) a été ajouté au groupe 'Protected Users'."
    } else {
        Write-Host "Le compte $($account.SamAccountName) est déjà dans le groupe 'Protected Users'."
    }
}

Write-Host "Tous les comptes administrateurs ont été vérifiés et ajoutés au groupe 'Protected Users' si nécessaire."