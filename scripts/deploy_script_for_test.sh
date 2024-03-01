#!/bin/bash

echo "Déploiement sur l'environnement de test"

# Arrêter l'ancienne version de l'application
systemctl stop mon_application_test

# Récupérer la dernière version depuis Git
git pull origin test

# Construire et déployer l'application
grails clean
grails compile
grails run-app &

echo "Déploiement terminé sur l'environnement de test"
