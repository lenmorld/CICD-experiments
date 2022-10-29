pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
		TEST_VAR_LENNY = 'lennythedev1.0'
		CURRENT_VERSION= "0.0.${currentBuild.number}"
	}
    stages {
		stage('Stage 2') {
			steps {
				echo "branch name: ${env.GIT_BRANCH}"
				echo "branch name: ${GIT_BRANCH}"
				echo "current version: ${CURRENT_VERSION}"
			}
		}

		stage('Stage 3 - Git') {
			steps {
				sh "pwd"
				sh "ls -la"
				sh "rm -rf argocd/"
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
