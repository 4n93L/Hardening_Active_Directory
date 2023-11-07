# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Nombre de jours depuis la désactivation après lesquels les comptes seront supprimés
$DaysInactive = 30
$DateToCheck = (Get-Date).AddDays(-$DaysInactive)

# Recherche et suppression des comptes désactivés
$DisabledAccounts = Get-ADUser -Filter {Enabled -eq $false -and whenChanged -lt $DateToCheck} -Properties whenChanged

foreach ($Account in $DisabledAccounts) {
    try {
        # Supprimer le compte utilisateur désactivé
        Remove-ADUser -Identity $Account.DistinguishedName -Confirm:$false
        Write-Host "Le compte utilisateur désactivé $($Account.SamAccountName) a été supprimé."
    } catch {
        Write-Error "Erreur lors de la suppression du compte utilisateur $($Account.SamAccountName)"
    }
}
