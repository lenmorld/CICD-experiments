pipeline {
    
    agent any

    environment {
        DOCKERHUB_CREDENTIALS=credentisl('dockerhub')
    }

    stages {
		stage('Build') {
			steps {
				sh 'docker build -t lenmorld/node_app:latest .'
			}
		}

        stage('Test') {
            steps {
                sh 'echo test 1'
                sh 'node --version'
            }
        }

        stage('Login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

        stage('Push') {
			steps {
				sh 'docker push lenmorld/node_app:latest'
			}
		}
    }
}
