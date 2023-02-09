pipeline {
    agent any
    
    options {
        timestamps()
    }

    stages {

        stage('Build') {
            steps {
                echo 'Building image...'
                sh 'docker build -t 2000GHz/hello-2048/hello-2048:1.0.${BUILD_NUMBER}'
            }
        }
    }
}
