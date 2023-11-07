#Kerberos_Settings_Hardening
# Configuration de la stratégie de durée de vie des tickets Kerberos (en heures)
$MaxTicketAge = "10"
$MaxRenewAge = "7"
$MaxServiceAge = "600" # 10 minutes
$MaxClockSkew = "5"

# Application des paramètres via la base de registre
$KerberosPolicyPath = "HKLM:\System\CurrentControlSet\Control\Lsa\Kerberos\Parameters"
New-ItemProperty -Path $KerberosPolicyPath -Name "MaxTicketAge" -Value $MaxTicketAge -PropertyType String -Force
New-ItemProperty -Path $KerberosPolicyPath -Name "MaxRenewAge" -Value $MaxRenewAge -PropertyType String -Force
New-ItemProperty -Path $KerberosPolicyPath -Name "MaxServiceAge" -Value $MaxServiceAge -PropertyType String -Force
New-ItemProperty -Path $KerberosPolicyPath -Name "MaxClockSkew" -Value $MaxClockSkew -PropertyType String -Force

Write-Host "Les paramètres de la politique Kerberos ont été renforcés."
