pipeline {
    agent {
        docker { 
			image 'node:16.13.1-alpine'
			args '-u root:root' 
		}
    }
    stages {
        stage('Test') {
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
    }
}
