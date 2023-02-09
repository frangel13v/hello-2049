pipeline {
    agent any
    
    options {
        timestamps()
    }

    environment {
        GITHUB_TOKEN=credentials('github-token')
        IMAGE_NAME='2000ghz/hello-2048/hello-2048'
        IMAGE_VERSION='${BUILD_NUMBER}'
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
                sh 'docker build -t $IMAGE_NAME:$IMAGE_VERSION .'
            }
        }

        stage('Login') {
            steps{
                sh 'echo $GITHUB_TOKEN_PSW | docker login ghcr.io -u $GITHUB_TOKEN_USR --password-stdin'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag $IMAGE_NAME:$IMAGE_VERSION ghcr.io/$IMAGE_NAME:$IMAGE_VERSION'
            }
        }

        stage ('Push Image') {
            sh 'docker push ghcr.io/$IMAGE_NAME:$IMAGE_VERSION'
        }


    }
}
