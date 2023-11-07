# Importation du module ActiveDirectory si ce n'est pas déjà fait
Import-Module ActiveDirectory

# Nom de la fonctionnalité de la corbeille AD
$recycleBinFeatureName = "Recycle Bin Feature"

# Récupération de la forêt Active Directory actuelle
$forest = Get-ADForest

# Vérification si la Corbeille est déjà activée
$recycleBinFeature = Get-ADOptionalFeature -Filter "Name -like 'Recycle Bin Feature'"

if ($recycleBinFeature -and $recycleBinFeature.IsEnabled) {
    Write-Host "La Corbeille Active Directory est déjà activée."
} else {
    try {
        # Activation de la fonctionnalité Corbeille
        Enable-ADOptionalFeature -Identity $recycleBinFeatureName `
                                 -Scope ForestOrConfigurationSet `
                                 -Target $forest.Name
        Write-Host "La Corbeille Active Directory a été activée avec succès."
    } catch {
        Write-Error "Une erreur s'est produite lors de la tentative d'activation de la Corbeille Active Directory"
    }
}
