pipeline {
    agent any

    stages {
          
        stage('Test') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'Amazon EC2', keyFileVariable: '')]) {
                    sh 'ssh ec2-user@52.49.48.142'
                    sh 'whoami'
                    sh 'pwd'
                    sh 'ls'
                    sh 'cat /etc/os-release'
                }
		  }
            }
        }
}
