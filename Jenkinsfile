pipeline {
    agent any

    stages {
        
        stage('SCM') {
            steps {
                git 'https://github.com/2000GHz/hello-2048'
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
            
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }    
        }
    }
}
