pipeline {
    agent any

    stages {
          
        stage('Test') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'Amazon EC2', keyFileVariable: 'AWS_KEY')]) {
                    sh 'ssh -tt -i $AWS_KEY ec2-user@52.49.48.142'
                    sh 'docker pull ghcr.io/2000ghz/hello-2048/hello-2048:v1'
                    sh 'docker run -d --rm -p 80:80  docker pull ghcr.io/2000ghz/hello-2048/hello-2048:v1'
                }
		  }
            }
        }
}
