# Recherche des comptes avec des mots de passe configurés pour ne jamais expirer
$neverExpireAccounts = Get-ADUser -Filter 'PasswordNeverExpires -eq $true' -Properties "Name", "PasswordNeverExpires"

# Vérification s'il y a des comptes à afficher
if ($neverExpireAccounts) {
    # Affichage de ces comptes
    Write-Host "Les comptes suivants ont des mots de passe configurés pour ne jamais expirer :"
    $neverExpireAccounts | Select-Object Name, PasswordNeverExpires | Format-Table -AutoSize

    # Demande de confirmation pour la réinitialisation
    $confirmation = Read-Host "Voulez-vous réinitialiser ces comptes pour que les mots de passe expirent ? (O/N)"
    
    if ($confirmation -eq 'O') {
        foreach ($account in $neverExpireAccounts) {
            # Réinitialisation de la propriété PasswordNeverExpires
            Set-ADUser $account -PasswordNeverExpires $false
            Write-Host "Le mot de passe de l'utilisateur $($account.Name) est maintenant configuré pour expirer."
        }
    } else {
        Write-Host "Aucune modification effectuée."
    }
} else {
    Write-Host "Aucun compte avec des mots de passe configurés pour ne jamais expirer n'a été trouvé."
}
