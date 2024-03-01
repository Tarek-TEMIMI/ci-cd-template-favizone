#!/bin/bash

# Variables
JENKINS_URL="http://url_de_votre_jenkins/"
JENKINS_USER="votre_utilisateur"
JENKINS_TOKEN="votre_token"
PROJET_JENKINS="Favizone"
REPO_GIT="https://username:token@url_du_repo.git"
CLONE_DIR="/chemin/vers/clone"

# Clone du dépôt Git
git clone $REPO_GIT $CLONE_DIR

# Exécution du pipeline Jenkins
java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USER:$JENKINS_TOKEN build $PROJET_JENKINS

# Nettoyage du clone
rm -rf $CLONE_DIR
