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

		stage('Stage 3 - Git') {
			steps {
				echo "rm -rf argocd/"
				echo "test 1"
				sh "git clone https://github.com/lenmorld/argocd.git"
				sh "cd argocd/"
				sh "pwd"
				sh "git checkout master"
				echo "current version: ${CURRENT_VERSION}"
				sh "pwd"
				sh "ls -la"
				sh "cd .."
				echo "rm -rf argocd/"
			}
		}
    }
	post {
		always {
			echo "test var again: ${TEST_VAR_LENNY}"
		}
	}
}
