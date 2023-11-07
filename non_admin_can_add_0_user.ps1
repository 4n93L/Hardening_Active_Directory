# Connexion au contrôleur de domaine (à exécuter en tant qu'administrateur du domaine)
Import-Module ActiveDirectory

# Récupération de l'objet domaine actuel
$domain = Get-ADDomain

# Définition du nombre d'ordinateurs qu'un utilisateur peut ajouter au domaine
# Remplacez '0' par la limite souhaitée
Set-ADDomain -Identity $domain -Replace @{'ms-DS-MachineAccountQuota'='0'}
