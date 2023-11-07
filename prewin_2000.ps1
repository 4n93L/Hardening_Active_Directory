# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Nom du groupe Pre-Windows 2000 Compatible Access
$preWin2000GroupName = "Pre-Windows 2000 Compatible Access"

# Obtenir le groupe Pre-Windows 2000 Compatible Access
$preWin2000Group = Get-ADGroup -Filter { Name -eq $preWin2000GroupName } -Properties Members

# Vérifier si le groupe a des membres
if ($preWin2000Group.Members) {
    # Énumérer et supprimer les membres du groupe
    foreach ($member in $preWin2000Group.Members) {
        try {
            # Supprimer le membre du groupe
            Remove-ADGroupMember -Identity $preWin2000Group -Members $member -Confirm:$false
            Write-Host "Le membre $member a été supprimé du groupe $preWin2000GroupName."
        } catch {
            Write-Error "Erreur lors de la suppression du membre $member du groupe $preWin2000GroupName"
        }
    }
} else {
    Write-Host "Il n'y a aucun membre à supprimer du groupe $preWin2000GroupName."
}