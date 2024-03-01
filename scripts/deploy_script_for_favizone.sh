#!/bin/bash

# Déployer la nouvelle version de l'application Favizone sur le serveur en utilisant SSH
ssh utilisateur@adresse_du_serveur << EOF

    # Aller dans le répertoire d'upgrade
    cd /home/favizone/resources/upgrade

    # Sauvegarder la version précédente de l'application Favizone
    cp favizone.jar favizone-backup.jar

    # Arrêter l'application web Favizone
    service favizone-webapp-service stop

    # Remplacer le fichier favizone.jar par le jar généré
    mv favizone-date.jar favizone.jar

    # Aller dans le répertoire favizone/
    cd /home/favizone/

    # Supprimer le contenu actuel du répertoire
    rm -r *

    # Extraire le contenu du nouveau jar
    jar xf ../favizone.jar

    # Redémarrer l'application web Favizone
    service favizone-webapp-service start

EOF
