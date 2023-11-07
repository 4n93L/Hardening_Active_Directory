#Audit_Logs_Monitoring.ps1
# Configuration des paramètres d'audit
$auditPolicySettings = @{
    "AuditAccountLogon" = "Success, Failure"
    "AuditAccountManagement" = "Success, Failure"
    "AuditLogonEvents" = "Success, Failure"
    "AuditObjectAccess" = "Success, Failure"
    "AuditPolicyChange" = "Success, Failure"
    "AuditPrivilegeUse" = "Success, Failure"
}

foreach ($auditPolicy in $auditPolicySettings.Keys) {
    $command = "auditpol /set /category:* /subcategory:`"$auditPolicy`" /success:enable /failure:enable"
    Invoke-Expression $command
    Write-Host "Audit policy $auditPolicy set to $($auditPolicySettings[$auditPolicy])."
}

# Afficher la configuration actuelle
Write-Host "Current Audit Policy Configuration:"
auditpol /get /category:*
