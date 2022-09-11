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
    }
}
