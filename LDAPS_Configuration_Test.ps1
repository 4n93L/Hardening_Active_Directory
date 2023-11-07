#LDAPS_Configuration_Test.ps1
$ldapsPort = 636
$domainControllers = Get-ADDomainController -Filter * | Select-Object -ExpandProperty HostName

foreach ($dc in $domainControllers) {
    try {
        $tcpConnection = Test-NetConnection -ComputerName $dc -Port $ldapsPort
        if ($tcpConnection.TcpTestSucceeded) {
            Write-Host "LDAPS est configuré et écoute sur le DC: $dc sur le port $ldapsPort"
        } else {
            Write-Host "LDAPS n'est pas détecté sur le DC: $dc sur le port $ldapsPort"
        }
    } catch {
        Write-Error "Une erreur est survenue lors de la vérification de LDAPS sur $dc"
    }
}
