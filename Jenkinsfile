pipeline {
    agent any

    stages {
        stage('Dev') {
            steps {
                script {
                    // Récupérer le code depuis Git
                    checkout scm

                    // Exécuter le playbook Ansible pour déployer sur l'environnement de dev
                    ansiblePlaybook(playbook: 'ansible/playbooks/deploy_dev.yml', inventory: 'ansible/inventaire/dev')
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Exécuter le playbook Ansible pour déployer sur l'environnement de test
                    ansiblePlaybook(playbook: 'ansible/playbooks/deploy_test.yml', inventory: 'ansible/inventaire/test')
                }
            }
        }

        stage('Prod') {
            steps {
                script {
                    // Exécuter le playbook Ansible pour déployer sur l'environnement de prod
                    ansiblePlaybook(playbook: 'ansible/playbooks/deploy_prod.yml', inventory: 'ansible/inventaire/prod')
                }
            }
        }

        stage('Deploy Favizone') {
            steps {
                script {
                    // Déployer la nouvelle version de l'application Favizone sur le serveur de prod
                    sh 'bash scripts/deploy_script_favizone.sh'
                }
            }
        }
    }
}
