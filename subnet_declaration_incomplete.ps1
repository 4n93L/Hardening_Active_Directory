# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Obtenir le contrôleur de domaine actuel
$dc = Get-ADDomainController -Discover

# Obtenir le site du contrôleur de domaine
$site = Get-ADReplicationSite -Identity $dc.Site

# Afficher le nom du site
Write-Host "Le contrôleur de domaine est dans le site AD:" $site.Name

# Définition des informations de sous-réseau avec le site AD récupéré
$subnetInfo = @{
    "192.168.56.0/24" = $site.Name;
    "10.0.2.0/24" = $site.Name;
}

# Création des sous-réseaux dans AD
foreach ($subnet in $subnetInfo.Keys) {
    $siteName = $subnetInfo[$subnet]
    try {
        # Vérifie si le sous-réseau existe déjà
        $existingSubnet = Get-ADReplicationSubnet -Filter "Name -eq '$subnet'" -ErrorAction SilentlyContinue
        if (-not $existingSubnet) {
            # Si le sous-réseau n'existe pas, créez-le
            New-ADReplicationSubnet -Name $subnet -Site $siteName
            Write-Host "Sous-réseau $subnet créé et associé au site $siteName."
        } else {
            Write-Host "Le sous-réseau $subnet existe déjà et est associé au site $siteName."
        }
    } catch {
        Write-Error "Erreur lors de la création du sous-réseau $subnet"
    }
}
