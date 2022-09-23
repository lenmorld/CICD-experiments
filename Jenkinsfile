pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Test') {
			agent {
				docker { image 'node:16.13.1-alpine' }
			}

            steps {
                sh 'echo test 4'
                sh 'pwd'
                sh 'ls'
				sh 'npm install'
				sh 'npm test'
            }
        }

		stage('Build') {
			steps {
				sh 'docker build -t lenmorld/node_app:latest .'
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
