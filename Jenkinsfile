pipeline {
    agent any
    
    options {
        timestamps()
    }

    environment {
        GITHUB_TOKEN=credentials('github-token')
    }

    stages {

        stage('Cleanup') {
            steps {
                sh 'docker system prune -a --volumes --force'
            }
        }

        stage('Build') {
            steps {
                echo 'Building image...'
                sh 'docker build -t 2000ghz/hello-2048/hello-2048:1.0.${BUILD_NUMBER} .'
            }
        }

        stage('Login') {
            steps{
                sh 'echo $GITHUB_TOKEN_PSW | docker login ghcr.io -u $GITHUB_TOKEN_USR --password-stdin'
            }
        }


    }
}
