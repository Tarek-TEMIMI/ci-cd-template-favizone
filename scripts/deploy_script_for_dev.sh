#!/bin/bash

echo "Déploiement sur l'environnement de développement"

# Arrêter l'ancienne version de l'application
systemctl stop mon_application_dev

# Récupérer la dernière version depuis Git
git pull origin dev

# Construire et déployer l'application
grails clean
grails compile
grails run-app &

echo "Déploiement terminé sur l'environnement de développement"
