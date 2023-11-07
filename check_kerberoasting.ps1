# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Identifier les comptes de service (utilisateurs dont le SPN est configuré)
$serviceAccounts = Get-ADUser -Filter {ServicePrincipalName -ne "$null"} -Properties ServicePrincipalName, PasswordLastSet

# Afficher les comptes de service et la date de leur dernier changement de mot de passe
$serviceAccounts | Select-Object Name, ServicePrincipalName, PasswordLastSet | Sort-Object PasswordLastSet | Format-Table -AutoSize

# Vous pouvez ajouter une logique supplémentaire pour signaler/alerter si le mot de passe n'a pas été changé depuis X jours
$threshold = (Get-Date).AddDays(-180) # Par exemple, mot de passe inchangé depuis plus de 180 jours
$oldServiceAccounts = $serviceAccounts | Where-Object { $_.PasswordLastSet -lt $threshold }

if ($oldServiceAccounts) {
    Write-Warning "Les comptes de service suivants ont des mots de passe qui n'ont pas été changés depuis plus de 180 jours:"
    $oldServiceAccounts | Select-Object Name, PasswordLastSet | Format-Table -AutoSize
} else {
    Write-Host "Tous les mots de passe des comptes de service ont été changés au cours des 180 derniers jours."
}
