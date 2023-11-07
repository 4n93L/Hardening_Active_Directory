#Services_Unnecessary_Disable.ps1
# Liste des services connus pour être inutiles sur les contrôleurs de domaine
$unnecessaryServices = @("Fax", "WSearch", "Spooler", "LMHosts", "RetailDemo")

foreach ($service in $unnecessaryServices) {
    try {
        $svc = Get-Service -Name $service -ErrorAction Stop
        if ($svc.Status -eq 'Running') {
            Stop-Service -Name $service
            Set-Service -Name $service -StartupType Disabled
            Write-Host "Service $service stopped and disabled."
        } else {
            Write-Host "Service $service is not running, no action taken."
        }
    } catch {
        Write-Host "Service $service not found or other error occurred."
    }
}
