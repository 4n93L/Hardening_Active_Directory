#Desactivate LLMNR
# Assurez-vous que le module GroupPolicy est importé
Import-Module GroupPolicy

# Nom de la nouvelle GPO
$GpoName = "DisableLLMNR"

# Créer la nouvelle GPO
$NewGPO = New-GPO -Name $GpoName -Comment "GPO to disable LLMNR"
$GpoId = $NewGPO.Id

# Lien de la GPO à la racine du domaine
$DomainDN = (Get-ADDomain).DistinguishedName
$NewGpoLink = New-GPLink -Name $GpoName -Target "OU=Domain Controllers,$DomainDN"

# Configuration du paramètre de stratégie pour désactiver LLMNR
$policyPath = "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient"
$policyName = "EnableMulticast"
$policyValue = 0 # 0 pour désactiver

# Vérifier si le chemin de la stratégie existe déjà, sinon le créer
if (-not (Test-Path $policyPath)) {
    New-Item -Path $policyPath -Force
}

# Appliquer la stratégie dans la GPO
Set-GPRegistryValue -Name $GpoName -Key $policyPath -ValueName $policyName -Type DWORD -Value $policyValue

# Affichage de la confirmation
Write-Host "LLMNR has been disabled for the domain through GPO: $GpoName"