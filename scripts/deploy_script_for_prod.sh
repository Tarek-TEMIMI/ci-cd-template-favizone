#!/bin/bash

echo "Déploiement sur l'environnement de production"

# Arrêter l'ancienne version de l'application
systemctl stop mon_application_prod

# Récupérer la dernière version depuis Git
git pull origin master

# Construire et déployer l'application
grails clean
grails compile
grails run-app &

echo "Déploiement terminé sur l'environnement de production"
