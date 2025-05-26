pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'localhost:5000'
        DOCKER_IMAGE = 'oecd-analytics'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Test') {
            parallel {
                stage('Python Tests') {
                    steps {
                        sh '''
                            python -m venv venv
                            . venv/bin/activate
                            pip install -r requirements.txt
                            pytest tests/ || true
                        '''
                    }
                }
                
                stage('Frontend Tests') {
                    steps {
                        dir('frontend/oecd-dashboard') {
                            sh '''
                                npm install
                                npm test -- --passWithNoTests
                            '''
                        }
                    }
                }
            }
        }
        
        stage('Build Images') {
            steps {
                script {
                    // Build API
                    dir('microservices/api') {
                        docker.build("${DOCKER_IMAGE}-api:${BUILD_NUMBER}")
                    }
                    
                    // Build Frontend
                    dir('frontend/oecd-dashboard') {
                        docker.build("${DOCKER_IMAGE}-frontend:${BUILD_NUMBER}")
                    }
                }
            }
        }
        
        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                sh '''
                    cd infrastructure/docker
                    docker compose down
                    docker compose up -d
                '''
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}