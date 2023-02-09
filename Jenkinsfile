pipeline {
    agent any
    
    options {
        timestamps()
    }

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
                sshagent(['ssh-amazon']) {
                    sh """
                        ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-49-48-142.eu-west-1.compute.amazonaws.com
                        docker pull ghcr.io/2000ghz/hello-2048/hello-2048:v1
                        docker run -d --rm -p 80:80 ghcr.io/2000ghz/hello-2048/hello-2048:v1
                    """
                }
            }
        }
    
    }
}