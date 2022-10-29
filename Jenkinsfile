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
						sh 'echo test 9'
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

		stage('GitOps - Argocd repo') {
			steps {
				echo "trigger test 3"
				sh "pwd"
				sh "rm -rf argocd/"
				sh "git clone https://github.com/lenmorld/argocd.git"
				sh "ls -la"
				// sh "sleep 1"
				// sh "cd argocd/"
				dir("argocd") {
					sh "pwd"
					sh "pwd"
					sh "git checkout master"
					echo "current version: ${CURRENT_VERSION}"
					sh "pwd"
					sh "ls -la"
					// sh "cd .."

                    // k8s stuff ===
					echo "> current kubernetes/deployment.yaml ==="
                    sh "cat kubernetes/deployment.yaml"
                    sh "echo current version: ${CURRENT_VERSION}"
                    // sh "export IMAGE_VERSION=lenmorld/node_app:${CURRENT_VERSION}"

                    echo "> Running bash script to deploy"
                    sh "chmod +x jenkins/deploy.sh"
                    sh "jenkins/deploy.sh lenmorld/node_app:${CURRENT_VERSION}"

                    echo "> git push"
                    sh "git add ."
                    sh "git commit -m \"update image in deployment.yaml\""
                    sh "git push origin master"
				}
				echo "rm -rf argocd/"
				sh "ls -la"
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
