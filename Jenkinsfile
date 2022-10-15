pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
		TEST_VAR_LENNY = 'lennythedev1.0'
	}
    stages {
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
			echo "test var again: ${TEST_VAR_LENNY}"
		}
	}
}
