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
                sshagent(['Hello2048EC2']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-52-49-48-142.eu-west-1.compute.amazonaws.com id
                    """
                }
            }
        }
    
    }
}