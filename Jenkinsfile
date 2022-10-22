pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
		TEST_VAR_LENNY = 'lennythedev1.0'
		CURRENT_VERSION= "0.0.${currentBuild.number}"
	}
    stages {
		stage('Scripted') {
			steps {
				echo 'scripted'
				script {
					def browsers  = ['chrome', 'firefox']

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
				echo "branch name: ${env.GIT_BRANCH}"
				echo "branch name: ${GIT_BRANCH}"
				echo "current version: ${CURRENT_VERSION}"
			}
		}

		stage('Stage 3') {
			steps {
				sh "cat kubernetes/deployment.yaml"
			}
		}
    }
	post {
		always {
			echo "test var again: ${TEST_VAR_LENNY}"
		}
	}
}
