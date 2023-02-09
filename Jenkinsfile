pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        stage('Package') {
            steps {
                withCredentials([string(credentialsId: 'Token-GitHub', variable: 'CR_PAT')]) {
                    sh "echo $CR_PAT | docker login ghcr.io -u 2000GHz --password-stdin"
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['estoyaburrido']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@52.49.48.142 id
                    """
                }
            }
        }
    
    }
}