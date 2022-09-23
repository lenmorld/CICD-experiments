pipeline {
    agent {
        docker { 
			image 'node:16.13.1-alpine'
			args '-u root:root'
			reuseNode true
		}
    }
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Version') {
            steps {
                sh 'node --version'
            }
        }

		stage('Install') {
            steps {
                sh 'echo test 4'
                sh 'pwd'
                sh 'ls'
				sh 'npm install'
            }
        }
        stage('Test') {
            steps {
				sh 'npm test'
            }
        }

		// TODO: FIX Docker not found, after adding Node
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
	post {
		always {
			sh 'docker logout'
		}
	}
}
