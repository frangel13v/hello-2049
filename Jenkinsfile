pipeline {
    agent any
    
    options {
        timestamps()
    }

    stages {

        stage('Cleanup') {
            steps {
                echo 'Cleaning system...'
                sh 'docker system prune -a --volumes --force'
            }
        }

        stage('Build') {
            steps {
                echo 'Building image...'
                sh '''docker-compose build
                      docker pull ghcr.io/2000ghz/hello-2048/hello-2048:latest
                      git tag 1.0.${BUILD_NUMBER}
                      docker tag ghcr.io/2000ghz/hello-2048/hello-2048:latest ghcr.io/2000ghz/hello-2048/hello2048:1.0.${BUILD_NUMBER}
                      '''
                      sshagent(['github-credentials']) {
                        sh('git push git@github.com:2000ghz/hello-2048.git --tags')
                      }
            }
        }

        stage('Login') {
            steps{
                echo 'Logging into GitHub'
                withCredentials([sshUserPrivateKey(credentialsId: 'github-credentials', keyFileVariable: 'GITHUB_TOKEN ')]) {
                    sh -o "echo $GITHUB_TOKEN | StrictHostKeyChecking=no | docker login ghcr.io -u 2000ghz --password-stdin"
                    sh 'docker push ghcr.io/2000ghz/hello-2048/hello2048:1.0.${BUILD_NUMBER}'
                }
        
            }
        }

    }
}
