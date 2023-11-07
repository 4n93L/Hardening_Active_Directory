# password_policy
# Importation du module ActiveDirectory
Import-Module ActiveDirectory

# Récupération du nom de domaine DNS actuel
$domain = (Get-ADDomain).DNSRoot

# Configuration des paramètres de la politique de mot de passe
try {
    # Définir la longueur minimale des mots de passe à 12
    Set-ADDefaultDomainPasswordPolicy -Identity $domain -MinPasswordLength 12
    Write-Host "La longueur minimale des mots de passe a été définie sur 12 pour le domaine $domain."

    # Pour activer la complexité du mot de passe, retirez le commentaire de la ligne suivante
    # Set-ADDefaultDomainPasswordPolicy -Identity $domain -ComplexityEnabled $true
    # Write-Host "La complexité du mot de passe a été activée pour le domaine $domain."

    # Configurer le verrouillage de compte après des tentatives de connexion échouées
    # Nombre de tentatives de connexion échouées autorisées avant le verrouillage
    $lockoutThreshold = 5
    # Durée du verrouillage de compte (en minutes)
    $lockoutDuration = 15
    # Durée de la fenêtre d'observation de verrouillage (en minutes)
    $lockoutObservationWindow = 15

    # Appliquer les paramètres de verrouillage de compte
    Set-ADDefaultDomainPasswordPolicy -Identity $domain -LockoutThreshold $lockoutThreshold
    Set-ADDefaultDomainPasswordPolicy -Identity $domain -LockoutDuration (New-TimeSpan -Minutes $lockoutDuration)
    Set-ADDefaultDomainPasswordPolicy -Identity $domain -LockoutObservationWindow (New-TimeSpan -Minutes $lockoutObservationWindow)

    Write-Host "La politique de verrouillage de compte a été configurée: seuil de verrouillage = $lockoutThreshold, durée de verrouillage = $lockoutDuration minutes, fenêtre d'observation de verrouillage = $lockoutObservationWindow minutes."

} catch {
    Write-Error "Une erreur s'est produite lors de la configuration de la politique de mot de passe"
}
