pipeline {
    agent any

    environment {
        VENV = 'venv'
        DOCKER_IMAGE = 'udayminfy/python-unittest-app'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage ("Install") {
            steps {
                sh '''
                    python3 -m venv $VENV
                    . $VENV/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt || echo "No requirements.txt found"
                '''
            }
        }

        stage ("Linting") {
            steps {
                script {
                    echo "This is my Linting Step"
                }
            }
        }

        stage ("Install Packages") {
            steps {
                script {
                    echo "This is Install Packages Step"
                }
            }
        }

        stage ("Run Application") {
            steps {
                script {
                    echo "This is my Run application Step"
                }
            }
        }

        stage ("Docker Build") {
            steps {
                script {
                    echo "Building Docker Image..."
                    sh "docker build -t $DOCKER_IMAGE:$DOCKER_TAG ."
                }
            }
        }

        stage ("Docker Push") {
            steps {
                script {
                    echo "Pushing Docker Image to Registry..."
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh '''
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            docker push $DOCKER_IMAGE:$DOCKER_TAG
                        '''
                    }
                }
            }
        }
    }
}
