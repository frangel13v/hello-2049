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
                withCredentials([string(credentialsId: 'github-token', variable: 'CR_PAT')]) {
                    sh "echo $CR_PAT | docker login ghcr.io -u codehead --password-stdin"
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-49-48-142.eu-west-1.compute.amazonaws.com id
                    """
                }
            }
        }
    
    }
}