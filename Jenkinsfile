pipeline {
    agent any

    stages {


        stage('Package') {
            steps {
                withCredentials([string(credentialsId: 'Token-GitHub', variable: 'CR_PAT')]) {
                    sh 'echo $CR_PAT | docker login ghcr.io -u 2000ghz --password-stdin'
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent(['Amazon EC2']) {
                    sh 'ssh -o "StrictHostKeyChecking no" ec2-user@52.49.48.142 date'
                }
            }
        }
    }
}



