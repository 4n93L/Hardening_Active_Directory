#Firewall_Rules_Enforcement.ps1
# Liste des règles de pare-feu nécessaires pour les contrôleurs de domaine
$firewallRules = @(
    @{
        Name = "AllowLDAPS";
        DisplayName = "LDAP over SSL";
        Direction = "Inbound";
        Protocol = "TCP";
        Port = "636";
    },
    @{
        Name = "AllowKerberos";
        DisplayName = "Kerberos Authentication";
        Direction = "Inbound";
        Protocol = "TCP";
        Port = "88";
    }
    # Ajoutez d'autres règles de pare-feu selon les besoins
)

foreach ($rule in $firewallRules) {
    if (-not (Get-NetFirewallRule -Name $rule.Name -ErrorAction SilentlyContinue)) {
        New-NetFirewallRule -Name $rule.Name -DisplayName $rule.DisplayName -Direction $rule.Direction -Protocol $rule.Protocol -LocalPort $rule.Port -Action Allow
        Write-Host "Firewall rule `"$($rule.DisplayName)`" created."
    } else {
        Write-Host "Firewall rule `"$($rule.DisplayName)`" already exists."
    }
}
