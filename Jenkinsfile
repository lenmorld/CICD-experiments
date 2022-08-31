pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building the apps'
               // sh 'npm install'
               // sh 'npm build'
            }
        }

        stage("test") {
            steps {
                echo 'testing the app'
            }
        }

        stage("deploy") {
            steps {
               echo 'deploying stuff'
            }
        }
    }
}