# Vérifiez d'abord les membres actuels
$SchemaAdmins = Get-ADGroupMember -Identity "Schema Admins"

if ($SchemaAdmins) {
    # Retirer chaque membre
    foreach ($member in $SchemaAdmins) {
        Remove-ADGroupMember -Identity "Schema Admins" -Members $member -Confirm:$false
        Write-Host "L'utilisateur $($member.SamAccountName) a été retiré du groupe 'Schema Admins'."
    }
} else {
    Write-Host "Le groupe 'Schema Admins' est déjà vide."
}
