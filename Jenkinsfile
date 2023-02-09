pipeline {
    agent any
    
    options {
        timestamps()
    }

    stages {

        stage('Build') {
            steps {
                echo 'Building image...'
                sh 'docker-compose build'
                sh "git tag 1.0.${BUILD_NUMBER}"
                withCredentials([sshUserPrivateKey(credentialsId: 'github-credentials', keyFileVariable: '')]) {
                    sh "git push --tags"
                }
                sh "docker tag ghcr.io/2000ghz/hello-2048:latest ghcr.io/2000ghz/hello-2048:1.0.${BUILD_NUMBER}"
                }
            }
        

        stage('Deploy') {
            steps {
                sshagent(['ssh-amazon']) {
                    sh 'ssh -o "StrictHostKeyChecking no" ec2-user@ec2-52-49-48-142.eu-west-1.compute.amazonaws.com "docker pull ghcr.io/2000ghz/hello-2048/hello-2048 && docker run -td --rm -p 80:80 ghcr.io/2000ghz/hello-2048/hello-2048"' 
                    
                }
            }
        } 
    }
}
