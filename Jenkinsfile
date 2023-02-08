pipeline {
    agent any

    stages {
          
        stage('Test') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'Amazon EC2', keyFileVariable: '')]) {
                    sh 'pwd'
                    sh 'mkdir test'
                    sh 'ls'
                }
                      // docker pull ghcr.io/2000ghz/hello-2048/hello-2048:v1
		  }
            }
        }
}
