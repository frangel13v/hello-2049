pipeline {
    agent any
    
    options {
        timestamps()
    }

    environment {
        GITHUB_TOKEN=credentials('github-token')
        IMAGE_NAME='hello-2048'
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
                sh 'docker build -t $IMAGE_NAME:${BUILD_NUMBER} .'
            }
        }

        stage('Login') {
            steps{
                sh 'echo $GITHUB_TOKEN_PSW | docker login ghcr.io -u 2000ghz --password-stdin'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag hello-2048:${BUILD_NUMBER} ghcr.io/2000ghz/hello-2048/$IMAGE_NAME:$IMAGE_VERSION'
            }
        }

        stage ('Push Image') {
            steps {
            sh 'docker push ghcr.io/$IMAGE_NAME:$IMAGE_VERSION'
            }
        }
    }
}
