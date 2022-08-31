pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building the app test lenny come on'
                echo BRANCH_NAME
               // sh 'npm install'
               // sh 'npm build'
            }
        }

        stage("test") {
            when {
                expression {
                    BRANCH_NAME == 'develop'
                }
            }

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
    post {
        always {
            // regardless if build failed or passed
            // e.g. send email to team
        }
        success {

        }
        failure {

        }
    }
}