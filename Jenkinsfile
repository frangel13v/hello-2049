pipeline {
    agent any

    stages {
          
        stage('Test') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'Amazon EC2', keyFileVariable: '')]) {
                    sh 'whoami'
                }
		  }
            }
        }
}
