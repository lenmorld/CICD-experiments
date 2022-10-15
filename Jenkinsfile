def globalVar
pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
		TEST_VAR_LENNY = 'lennythedev1.0'
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
		}

		stage('Stage 1') {
			steps {
				echo "Test var value: ${TEST_VAR_LENNY}"
				echo 'printenv: >>>'
				sh 'printenv'
			}
		}

		stage('Stage 2') {
			steps {
				echo "branch name: ${env.BRANCH_NAME}"
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}
