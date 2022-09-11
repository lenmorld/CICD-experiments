pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentisl('dockerhub')
    }
    stages {
        stage('Test') {
            steps {
                sh 'echo test 1'
            }
        }
    }
}
