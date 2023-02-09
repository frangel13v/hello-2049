pipeline {
    agent any
    
    options {
        timestamps()
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
                echo 'Build'
            }
        }
        stage('Login') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'CR_PAT')]) {
                    sh "echo $CR_PAT | docker login ghcr.io -u 2000GHz --password-stdin"
                }
            }
        }
        stage('Deploy') {
            steps {
                sshagent(['Amazon EC2']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-50-247-215.eu-west-1.compute.amazonaws.com id
                    """
                }
            }
        }
    
    }
}