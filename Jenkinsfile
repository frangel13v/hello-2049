pipeline {
    agent any

    stages {

        stage('Build'){
            steps {
                sh ''
            }
        

        stage('Package'){
            steps {
                withCredentials([string(credentialsId: 'Token-GitHub', variable: 'CR_PAT')]) {
                    sh 'echo $CR_PAT | docker login ghcr.io -u 2000ghz --password-stdin'
                    }
                }
            }





        stage('Deploy') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'Amazon EC2', keyFileVariable: '')]) {
                    sh 'ssh ec2-user@52.49.48.142 id'


                }
		  }
            }
        }
}

