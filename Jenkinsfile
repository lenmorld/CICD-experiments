pipeline {
    agent {
        docker { image 'node:16.13.1-alpine' }
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

    }
}
