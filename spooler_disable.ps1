# Désactiver le service Spooler et le configurer pour un démarrage manuel
try {
    # Arrêter le service Spooler si en cours d'exécution
    Stop-Service -Name Spooler -Force

    # Configurer le type de démarrage du service Spooler sur 'Désactivé'
    Set-Service -Name Spooler -StartupType Disabled

    Write-Host "Le service Spooler a été désactivé et configuré pour ne pas démarrer automatiquement."
} catch {
    Write-Error "Une erreur s'est produite lors de la désactivation du service Spooler"
}
