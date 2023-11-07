# Fichiers PowerShell pour la Sécurité d'Active Directory

Ce référentiel contient une série de fichiers PowerShell visant à renforcer la sécurité de votre environnement Active Directory. Chaque fichier a une fonction spécifique dans le cadre de la gestion et de la sécurité de l'Active Directory. Voici une brève description de chaque fichier :

## activate_recycle_bin.ps1
- **Objectif** : Active la corbeille de récupération dans Active Directory, permettant de restaurer les objets supprimés accidentellement.

## admin_account_flag_sensitive.ps1
- **Objectif** : Marque certains comptes d'administrateur comme "sensibles", renforçant leur sécurité.

## Audit_Logs_Monitoring.ps1
- **Objectif** : Surveille les journaux d'audit d'Active Directory pour détecter des activités suspectes et renforcer la sécurité.

## change_password_at_logon.ps1
- **Objectif** : Force les utilisateurs à changer leur mot de passe lors de leur prochaine connexion, améliorant ainsi la sécurité des mots de passe.

## check_kerberoasting.ps1
- **Objectif** : Vérifie la résistance de l'environnement Active Directory à l'attaque de Kerberoasting.

## create_certificat_autosigned.ps1
- **Objectif** : Crée des certificats auto-signés pour une utilisation sécurisée dans l'environnement Active Directory.

## delete_old_desactivated_users.ps1
- **Objectif** : Supprime les comptes d'utilisateurs désactivés depuis un certain temps pour maintenir la sécurité de l'annuaire.

## delete_old_users.ps1
- **Objectif** : Supprime les utilisateurs qui ne se sont pas connectés depuis un certain temps, contribuant à la sécurité de l'environnement.

## disable_LLMNR.ps1
- **Objectif** : Désactive le protocole LLMNR (Link-Local Multicast Name Resolution) pour renforcer la sécurité du réseau.

## Firewall_Rules_Enforcement.ps1
- **Objectif** : Applique et vérifie les règles de pare-feu pour renforcer la sécurité du réseau.

## gestion_des_incidents.ps1
- **Objectif** : Fournit des scripts de gestion des incidents pour faire face aux violations de sécurité potentielles.

## group_not_empty.ps1
- **Objectif** : Vérifie que les groupes ne contiennent pas d'utilisateurs vides ou inactifs, renforçant ainsi la gestion des groupes.

## hardened_path_lower_secu_level.ps1
- **Objectif** : Renforce les paramètres de sécurité pour les chemins d'accès dans Active Directory pour réduire les risques.

## Kerberos_Settings_Hardening.ps1
- **Objectif** : Durcit les paramètres de sécurité de Kerberos pour réduire les vulnérabilités.

## LDAPS_Configuration_Test.ps1
- **Objectif** : Teste la configuration de LDAPS (LDAP over SSL/TLS) pour garantir la sécurité des communications.

## ListUsersWithDescription.ps1
- **Objectif** : Génère une liste des utilisateurs avec leurs descriptions associées, utile pour l'audit.

## number_of_admin_not_in_protected_users.ps1
- **Objectif** : Vérifie le nombre d'administrateurs non inclus dans un groupe d'utilisateurs protégés pour une sécurité accrue.

## password_never_expire.ps1
- **Objectif** : Configure des comptes utilisateur pour que leurs mots de passe n'expirent jamais, parfois nécessaire pour les comptes de service.

## password_policy.ps1
- **Objectif** : Permet de gérer la politique de mot de passe, notamment l'exigence de complexité et de changement périodique.

## Services_Unnecessary_Disable.ps1
- **Objectif** : Désactive les services inutiles dans Active Directory pour réduire les vecteurs d'attaque.

## sid_filternig.ps1
- **Objectif** : Configure le filtrage SID pour restreindre l'accès à des objets spécifiques dans Active Directory.

## spooler_disable.ps1
- **Objectif** : Désactive le service de spouleur d'impression pour réduire les risques d'attaque.

## subnet_declaration_incomplete.ps1
- **Objectif** : Vérifie et corrige les déclarations de sous-réseau incomplètes dans Active Directory pour garantir la cohérence des informations réseau.

## non_admin_can_add_0_user.ps1
- **Objectif** : Restreint la capacité des utilisateurs non administrateurs à ajouter de nouveaux utilisateurs pour renforcer la sécurité.

Chacun de ces fichiers contribue à améliorer la sécurité et la gestion d'Active Directory en automatisant des tâches spécifiques liées aux comptes, aux groupes, aux paramètres et à la sécurité de l'annuaire. Utilisez-les judicieusement en fonction de vos besoins de sécurité spécifiques.
