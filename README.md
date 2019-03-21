# GESTION PRODUITS

## Prérequis
Cette application est compatible `PHP5` et a été testée avec une base de données `MySQL 5.7`.

## Installation
- Copier les fichiers du dossier `www` dans un dossier accessible par le serveur Web.
- Assurez vous que le dossier `uploads` est accessible en lecture et écriture par le serveur Web : `chmod 777 uploads`
- Importez la base de données test à partir du dump SQL `database/gestion_produits.sql`.
- Connectez vous à l'application avec l'url adaptée avec les informations suivantes :
    - Login : `admin`
    - Mot de passe : `password`

## Fonctionnalités
L'application permet de :
- Lister les produits
- Afficher la fiche produit en lecture seule
- Ajouter des produits
- Modifier les produits
- Supprimer les produits
- Pour chaque produit, il est possible d'ajouter autant de photos que nécessaire

# Issue 1
## Conteneuriser l'application
Nous souhaitons que l'application puisse être déployée par Docker afin de faciliter son intégration sur différentes plate-formes et notamment sur le Cloud.
La base test fournie dans le dépôt doit être chargée par défaut dès le déploiement de l'application afin que celle-ci soit opérationnelle immédiatement.
Il doit y avoir au minimum un container pour l'application PHP et un pour la base de données MySQL.

> docker-compose up

# Issue 2
## Utiliser un système de stockage objet pour les images des produits
Actuellement, les images des produits sont stockées sur le disque du serveur Web / PHP. Cela risque de poser problème sur une grande quantité de photos sont stockées.
Pour améliorer cela, nous souhaiterions que les photos des produits soient stockés sur un système de stockage objet.
Privilégiez un stockage compatible avec l'API S3 : le serveur Minio (https://www.minio.io/) pourra faire l'affaire.
Votre modification devra permettre à l'application l'upload des photos vers le stockage objet et leur affichage à partir de ce même stockage.

# Issue 3
## Optimiser l'intégration dans un orchestrateur de containers
A terme, cette application sera déployée sur un orchestrateur de container (Kubernetes ou Docker Swarm).
Effectuez les modifications nécessaires de manière à ce que cette application puisse s'intégrer le plus facilement possible dans ces orchestrateurs en permettant notamment une mise à l'échelle horizontale (ajout de plusieurs serveurs pour chaque service).
