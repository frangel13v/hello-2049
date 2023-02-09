pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        stage('Login') {
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
                        ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-50-247-215.eu-west-1.compute.amazonaws.com id
                    """
                }
            }
        }
    
    }
}