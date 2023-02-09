pipeline {
    agent any
    
    options {
        timestamps()
    }

    stages {

        stage('Build') {
            steps {
                withCredentials([string(credentialsId: 'Token-GitHub', variable: 'CR_PAT')]) {
                    sh "echo $CR_PAT | docker login ghcr.io -u 2000GHz --password-stdin"
                    sh "docker build -t ghcr.io/2000ghz/hello-2048/hello-2048:latest ."
                    sh "docker push ghcr.io/2000ghz/hello-2048/hello-2048:latest"
                    sh "docker-compose push ghcr.io/2000ghz/hello-2048/hello-2048:latest"
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh 'ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-49-48-142.eu-west-1.compute.amazonaws.com "docker kill $(docker ps -q) && docker pull ghcr.io/2000ghz/hello-2048/hello-2048 && docker run -td --rm -p 80:80 ghcr.io/2000ghz/hello-2048/hello-2048"' 
                    echo 'Deploy Complete! Ready to play! :)'
                }
            }
        } 
    }
}