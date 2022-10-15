// def not allowed in Declartive pipeline
// def globalVar

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

		stage('Scripted') {
			steps {
				echo 'scripted'
				script {
					def browsers  = ['crhome', 'firefox']

					for (int i=0; i < browsers.size(); i++) {
						echo "Testing the ${browsers[i]} browser"
					}
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
