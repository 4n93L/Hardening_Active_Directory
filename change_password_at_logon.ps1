# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Obtenir tous les comptes d'utilisateurs actifs
$users = Get-ADUser -Filter 'enabled -eq $true' -Properties PasswordLastSet

foreach ($user in $users) {
    try {
        # Forcer l'utilisateur à changer de mot de passe à la prochaine connexion
        Set-ADUser $user -ChangePasswordAtLogon $true
        Write-Host "L'utilisateur $($user.SamAccountName) doit changer son mot de passe à la prochaine connexion."
    } catch {
        Write-Error "Impossible de mettre à jour le compte utilisateur $($user.SamAccountName)"
    }
}
