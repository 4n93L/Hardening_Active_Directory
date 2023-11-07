# Importer le module Active Directory
Import-Module ActiveDirectory

# Rechercher tous les comptes d'administrateurs
$adminAccounts = Get-ADGroupMember 'Administrators' -recursive | where { $_.objectClass -eq 'user' }

# Parcourir chaque compte et définir le flag "This account is sensitive and cannot be delegated"
foreach ($account in $adminAccounts) {
    # Récupérer les propriétés actuelles du compte
    $user = Get-ADUser $account -Properties 'AccountNotDelegated'
    
    # Vérifier si le compte est déjà marqué comme sensible et ne pouvant pas être délégué
    if (-not $user.AccountNotDelegated) {
        # Définir le compte comme sensible et ne pouvant pas être délégué
        Set-ADUser $user -AccountNotDelegated $true
        Write-Host "Le compte $($user.SamAccountName) est maintenant marqué comme sensible et ne peut pas être délégué."
    } else {
        Write-Host "Le compte $($user.SamAccountName) est déjà configuré correctement."
    }
}

Write-Host "Tous les comptes administrateurs ont été vérifiés et mis à jour si nécessaire."