pipeline {
    agent any
	environment {
		CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
		CURRENT_VERSION= "0.0.${currentBuild.number}"
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

			stages {
				stage('Version') {
					steps {
						sh 'node --version'
					}
				}

				stage('Install') {
					steps {
						sh 'echo test 5'
						sh 'pwd'
						sh 'ls'
						sh 'npm install'
					}
				}

				stage('Test') {
					steps {
						sh 'npm test'
					}
				}
        	}
		}

		stage('Docker build') {
			steps {
				sh "docker build -t lenmorld/node_app:${CURRENT_VERSION} ."
			}
		}

        stage('Docker login') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

        stage('Docker push') {
			steps {
				sh "docker push lenmorld/node_app:${CURRENT_VERSION}"
			}
		}

		stage('Git cleanup') {
			steps {
				sh "git config pull.rebase false"
				sh "git show-ref"
				sh "git status"
				sh "git stash save"
				// sh "git reset --hard HEAD"
				sh "git checkout master"
				sh "git pull origin master -f"
				// sh "git fetch origin"
				// sh "git merge origin/master"
				// sh "git pull"
				echo "=== after pull: kubernetes/deployment.yaml ===="
				sh "cat kubernetes/deployment.yaml"
				echo "=== end ==="
			}
		}

		stage('Deploy to k8s') {
			steps {
				sh "echo current version: ${CURRENT_VERSION}"
				// sh "export IMAGE_VERSION=lenmorld/node_app:${CURRENT_VERSION}"

				echo "> Running bash script to deploy"

				sh "pwd"
				sh "ls -la"

				sh "chmod +x jenkins/deploy.sh"
				sh "jenkins/deploy.sh lenmorld/node_app:${CURRENT_VERSION}"
			}
		}

		stage('Git push') {
			steps {
				sh "git add ."
				sh "git commit -m \"update image in deployment.yaml\""
				sh "git push origin HEAD:master -f"
			}
		}

		stage('Git tag') {
			steps {
				sh "git status"
				sh "git tag ${CURRENT_VERSION}"
				sh "git push origin ${CURRENT_VERSION}"
			}
		}
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}
