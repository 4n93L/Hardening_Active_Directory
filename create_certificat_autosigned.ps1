# créer le dossier "C:\Certs" avant de lancer le script,
# Définir les paramètres pour le certificat auto-signé
$dnsName = "ldapsserver.domain.com" # Remplacer par le FQDN de votre serveur LDAP/AD
$certFilePath = "C:\Certs" # Le chemin où enregistrer le certificat et la clé
$certFileName = "ldapscert" # Un nom de fichier pour le certificat et la clé privée
$exportPassword = ConvertTo-SecureString -String "YourStrongPassword" -Force -AsPlainText # Définissez un mot de passe fort

# Création du répertoire de certificats s'il n'existe pas
if (-not (Test-Path $certFilePath)) {
    New-Item -ItemType Directory -Path $certFilePath
}

# Création du certificat auto-signé
$cert = New-SelfSignedCertificate -DnsName $dnsName -CertStoreLocation "cert:\LocalMachine\My" -KeyExportPolicy Exportable -KeySpec KeyExchange

# Exportation du certificat en .pfx
$exportPath = Join-Path -Path $certFilePath -ChildPath "$certFileName.pfx"
Export-PfxCertificate -Cert $cert -FilePath $exportPath -Password $exportPassword

# Exportation du certificat en .cer
$cerPath = Join-Path -Path $certFilePath -ChildPath "$certFileName.cer"
Export-Certificate -Cert $cert -FilePath $cerPath

Write-Host "Certificat auto-signé créé et exporté à : $exportPath et $cerPath"
