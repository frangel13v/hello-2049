pipeline {
    agent any

    stages {
          
        stage('Build') {
            steps {
                sshagent(['amazon ec2 ssh']) {
                      docker pull ghcr.io/2000ghz/hello-2048/hello-2048:v1
		  }
            }
        }
            
        stage('Deploy') {
            steps {
              sshagent(['amazon ec2 ssh']) {
                      docker run ghcr.io/2000ghz/hello-2048/hello-2048:v1
                        }  
            }    
        }
    }
}
