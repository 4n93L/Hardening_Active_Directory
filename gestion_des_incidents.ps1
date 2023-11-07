# Importation du module ActiveDirectory et du module EventLog pour la journalisation
Import-Module ActiveDirectory
Import-Module PSWindowsUpdate

# Définir le chemin du fichier journal pour enregistrer les incidents
$incidentLogPath = "C:\SecurityLogs\IncidentLog.txt"

# Créer le répertoire pour le fichier journal s'il n'existe pas
if (-not (Test-Path (Split-Path -Path $incidentLogPath -Parent))) {
    New-Item -ItemType Directory -Path (Split-Path -Path $incidentLogPath -Parent) -Force
}

# Fonction pour écrire dans le fichier journal
function Write-IncidentLog {
    param (
        [string]$Message
    )
    Add-Content -Path $incidentLogPath -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss'): $Message"
}

# Exemple de journalisation d'une alerte de sécurité
Write-IncidentLog -Message "Alerte de sécurité: Début de la surveillance des incidents pour le DC."

# Configurer les abonnements aux événements critiques
$EventLogsToMonitor = @("Security", "Application", "System")
foreach ($Log in $EventLogsToMonitor) {
    Get-WinEvent -LogName $Log -MaxEvents 50 | Where-Object {
        # Ici, définissez les conditions pour les événements critiques (par exemple, ID de l'événement ou Source)
        $_.LevelDisplayName -eq "Critical" -or $_.LevelDisplayName -eq "Error"
    } | ForEach-Object {
        Write-IncidentLog -Message "Incident détecté: $($_.Message)"
    }
}
