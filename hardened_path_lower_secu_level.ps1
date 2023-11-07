# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Nom de la nouvelle GPO
$GpoName = "HardenedUNCPaths"

# Obtenir les informations du domaine
$domain = Get-ADDomain
$DomainDN = $domain.DistinguishedName
$DomainControllersOU = "OU=Domain Controllers," + $DomainDN

# Créer la nouvelle GPO
$gpo = New-GPO -Name $GpoName -Comment "GPO to harden UNC paths for NETLOGON and SYSVOL"

# Définir les chemins renforcés pour NETLOGON et SYSVOL
$uncPaths = @("\\*\NETLOGON", "\\*\SYSVOL")
foreach ($uncPath in $uncPaths) {
    Set-GPRegistryValue -Name $GpoName -Key "HKLM\Software\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -ValueName "$uncPath" -Type String -Value "RequireMutualAuthentication=1, RequireIntegrity=1"
}

# Lien de la GPO à l'unité d'organisation des contrôleurs de domaine
New-GPLink -Name $GpoName -Target $DomainControllersOU

# Mise à jour des politiques
Invoke-GPUpdate -RandomDelayInMinutes 0 -Force

Write-Host "Les chemins renforcés pour NETLOGON et SYSVOL ont été configurés et la GPO est liée à l'OU des contrôleurs de domaine."