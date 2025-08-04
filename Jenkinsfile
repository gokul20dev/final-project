pipeline {
    agent any

    environment {
        DOCKERHUB_USERNAME = 'gokul603'           // Your Docker Hub username
        IMAGE_NAME = ''
    }

    stages {
        stage('Set Image Name Based on Branch') {
            steps {
                script {
                    def branch = env.GIT_BRANCH ?: env.BRANCH_NAME
                    echo "Building branch: ${branch}"
                    
                    if (branch.endsWith('dev')) {
                        IMAGE_NAME = "${DOCKERHUB_USERNAME}/devops-static-dev"
                    } else if (branch.endsWith('main') || branch.endsWith('master')) {
                        IMAGE_NAME = "${DOCKERHUB_USERNAME}/devops-static-prod"
                    } else {
                        error "Unsupported branch: ${branch}"
                    }
                    echo "Docker image: ${IMAGE_NAME}"
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                    chmod +x build.sh
                    ./build.sh ${IMAGE_NAME}
                '''
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${IMAGE_NAME}
                        docker logout
                    '''
                }
            }
        }
        stage('Deploy Application') {
            steps {
                sh '''
                    chmod +x deploy.sh
                    ./deploy.sh ${IMAGE_NAME}
                '''
            }
        }
    }
    post {
        failure {
            echo "Build failed! Check logs for details."
        }
    }
}

