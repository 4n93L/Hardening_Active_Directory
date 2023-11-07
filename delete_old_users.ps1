# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Définir la durée d'inactivité (180 jours dans ce cas)
$inactiveDuration = (Get-Date).AddMonths(-6)

# Rechercher les comptes utilisateurs qui n'ont pas eu d'activité de connexion depuis 6 mois
$inactiveAccounts = Get-ADUser -Filter {LastLogonTimeStamp -lt $inactiveDuration -and enabled -eq $true} -Properties LastLogonTimeStamp

# Afficher les comptes inactifs
$inactiveAccounts | Select Name, SamAccountName, LastLogonTimeStamp

# Demander confirmation avant suppression
$confirmation = Read-Host "Voulez-vous supprimer tous les comptes utilisateurs inactifs listés ci-dessus ? (oui/non)"

if ($confirmation -eq "oui") {
    foreach ($account in $inactiveAccounts) {
        try {
            # Supprimer le compte utilisateur
            Remove-ADUser -Identity $account.DistinguishedName -Confirm:$false
            Write-Host "Compte utilisateur $($account.SamAccountName) supprimé avec succès."
        } catch {
            Write-Error "Erreur lors de la suppression du compte utilisateur $($account.SamAccountName)"
        }
    }
} else {
    Write-Host "Suppression des comptes annulée."
}
