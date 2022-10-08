pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages {
        stage('Node') {
			agent {
				docker { 
					image 'node:16.13.1-alpine'
					args '-u root:root'
					// Run the container on the node specified at the
                    // top-level of the Pipeline, in the same workspace,
                    // rather than on a new node entirely
					// reuseNode true
				}
			}

			stages {
				stage('Version') {
					steps {
						sh 'node --version'
					}
				}

				stage('Install') {
					steps {
						sh 'echo test 5'
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
        	}
		}

		stage('Docker build') {
			steps {
				sh 'docker build -t lenmorld/node_app:latest .'
			}
		}

        stage('Docker login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

        stage('Docker push') {
			steps {
				sh 'docker push lenmorld/node_app:latest'
			}
		}

		stage('Deploy') {
			steps {
				sh "echo current version: ${currentBuild.number}"
				sh "git status"
				sh "git tag 0.0.${currentBuild.number}"
				sh "git push origin 0.0.${currentBuild.number}"
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}
