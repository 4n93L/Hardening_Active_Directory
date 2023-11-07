# Contrôles de Sécurité pour un Active Directory (AD) Robuste

1. Politiques de Mot de Passe
   - Exiger des mots de passe complexes et longs.
   - Forcer le changement périodique des mots de passe.
   - Configurer un verrouillage de compte en cas de tentatives de connexion infructueuses.
   - Activer l'historique des mots de passe pour empêcher la réutilisation des mots de passe précédents.
   - Activer la réinitialisation du mot de passe uniquement par des méthodes sécurisées.

2. Gestion des Comptes Utilisateurs
   - Désactiver les comptes inactifs ou obsolètes.
   - Supprimer les comptes d'utilisateur désactivés depuis un certain temps.
   - Mettre en place une procédure stricte pour la création, la modification et la suppression de comptes utilisateurs.
   - Utiliser le principe du moindre privilège pour attribuer des autorisations aux comptes.

3. Gestion des Groupes
   - Nettoyer régulièrement les groupes inutilisés ou obsolètes.
   - Établir des règles strictes pour l'appartenance aux groupes.
   - Réduire au minimum le nombre de membres des groupes d'administration.

4. Surveillance de l'Authentification
   - Activer la surveillance des journaux d'audit pour suivre les activités de connexion.
   - Mettre en place une solution de gestion des informations et des événements de sécurité (SIEM) pour la détection d'anomalies.
   - Surveiller les tentatives de connexion infructueuses et les comptes bloqués.

5. Politiques de Sécurité
   - Définir des stratégies de sécurité pour les systèmes membres.
   - Appliquer des règles de pare-feu appropriées pour protéger les contrôleurs de domaine.

6. Mise à Jour et Correctifs
   - Appliquer régulièrement les mises à jour de sécurité et les correctifs.
   - Mettre en place une stratégie de gestion des correctifs pour les serveurs AD.

7. Contrôles d'Accès
   - Configurer des listes de contrôle d'accès (ACL) pour les ressources sensibles.
   - Appliquer des autorisations appropriées aux objets AD, en limitant l'accès aux utilisateurs autorisés.

8. Sauvegarde et Restauration
   - Planifier des sauvegardes régulières d'Active Directory et des données critiques.
   - Tester la restauration des sauvegardes pour garantir leur efficacité.

9. Durcissement des Services AD
   - Désactiver les services inutiles.
   - Configurer les paramètres de sécurité de Kerberos.
   - Activer la corbeille de récupération.

10. Surveillance des Privilèges
    - Surveiller les modifications des groupes d'administrateurs.
    - Mettre en place une gestion stricte des comptes d'administrateur.

11. Sensibilisation à la Sécurité
    - Former le personnel sur les meilleures pratiques de sécurité et de gestion d'AD.
    - Sensibiliser les utilisateurs aux menaces de sécurité et aux pratiques d'authentification sûres.

12. Audit et Documentation
    - Réaliser des audits de sécurité réguliers pour évaluer la conformité aux politiques de sécurité.
    - Documenter les procédures de sécurité et de gestion d'Active Directory.

13. Plan de Réponse aux Incidents
    - Élaborer un plan de réponse aux incidents pour faire face aux violations de sécurité potentielles.

14. Gestion des Certificats
    - Gérer les certificats pour l'authentification sécurisée.
