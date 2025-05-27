// Jenkinsfile
pipeline {
    agent any
    
    environment {
        COMPOSE_PROJECT_NAME = 'oecd-test'
        DOCKER_BUILDKIT = '1'
        PYTHONPATH = '/var/jenkins_home/workspace/oecd-analytics-pipeline'
    }
    
    stages {
        stage('Setup Workspace') {
            steps {
                script {
                    echo "Setting up workspace..."
                    // Clean workspace and copy files
                    sh '''
                        rm -rf /var/jenkins_home/workspace/oecd-analytics-pipeline/*
                        cp -r /workspace/oecd-analytics-platform/* /var/jenkins_home/workspace/oecd-analytics-pipeline/
                        ls -la /var/jenkins_home/workspace/oecd-analytics-pipeline/
                    '''
                }
            }
        }
        
        stage('Test') {
            parallel {
                stage('Unit Tests') {
                    steps {
                        dir('tests') {
                            sh '''
                                echo "Running Unit Tests..."
                                python3 -m venv test_env
                                . test_env/bin/activate
                                pip install -r requirements.txt
                                python -m pytest unit/ -v --junitxml=unit-test-results.xml --html=unit-test-report.html
                            '''
                        }
                    }
                    post {
                        always {
                            junit 'tests/unit-test-results.xml'
                            publishHTML([
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'tests',
                                reportFiles: 'unit-test-report.html',
                                reportName: 'Unit Test Report'
                            ])
                        }
                    }
                }
                
                stage('Integration Tests') {
                    steps {
                        sh '''
                            echo "Running Integration Tests..."
                            cd tests
                            python3 -m venv test_env
                            . test_env/bin/activate
                            pip install -r requirements.txt
                            python -m pytest integration/ -v --junitxml=integration-test-results.xml --html=integration-test-report.html
                        '''
                    }
                    post {
                        always {
                            junit 'tests/integration-test-results.xml'
                            publishHTML([
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'tests',
                                reportFiles: 'integration-test-report.html',
                                reportName: 'Integration Test Report'
                            ])
                        }
                    }
                }
                
                stage('ETL Tests') {
                    steps {
                        sh '''
                            echo "Running ETL Tests..."
                            cd tests
                            python3 -m venv test_env
                            . test_env/bin/activate
                            pip install -r requirements.txt
                            python -m pytest etl/ -v --junitxml=etl-test-results.xml --html=etl-test-report.html
                        '''
                    }
                    post {
                        always {
                            junit 'tests/etl-test-results.xml'
                            publishHTML([
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'tests',
                                reportFiles: 'etl-test-report.html',
                                reportName: 'ETL Test Report'
                            ])
                        }
                    }
                }
                
                stage('LLM Tests') {
                    steps {
                        sh '''
                            echo "Running LLM Tests..."
                            cd tests
                            python3 -m venv test_env
                            . test_env/bin/activate
                            pip install -r requirements.txt
                            python -m pytest llm/ -v --junitxml=llm-test-results.xml --html=llm-test-report.html
                        '''
                    }
                    post {
                        always {
                            junit 'tests/llm-test-results.xml'
                            publishHTML([
                                allowMissing: false,
                                alwaysLinkToLastBuild: true,
                                keepAll: true,
                                reportDir: 'tests',
                                reportFiles: 'llm-test-report.html',
                                reportName: 'LLM Test Report'
                            ])
                        }
                    }
                }
            }
        }
        
        stage('UI Tests') {
            steps {
                sh '''
                    echo "Running UI Tests..."
                    cd tests/ui
                    npm install
                    # Run Selenium tests
                    python3 -m venv ui_test_env
                    . ui_test_env/bin/activate
                    pip install -r requirements.txt
                    python -m pytest selenium/ -v --junitxml=ui-test-results.xml --html=ui-test-report.html
                    
                    # Run Cypress tests
                    npm run cypress:run -- --reporter junit --reporter-options mochaFile=cypress-test-results.xml
                '''
            }
            post {
                always {
                    junit 'tests/ui/ui-test-results.xml'
                    junit 'tests/ui/cypress-test-results.xml'
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: 'tests/ui',
                        reportFiles: 'ui-test-report.html',
                        reportName: 'UI Test Report'
                    ])
                }
            }
        }
        
        stage('BDD Tests') {
            steps {
                sh '''
                    echo "Running BDD Tests..."
                    cd tests/bdd
                    python3 -m venv bdd_env
                    . bdd_env/bin/activate
                    pip install -r requirements.txt
                    behave --junit --junit-directory=. --format json -o behave-results.json
                '''
            }
            post {
                always {
                    cucumber buildStatus: 'UNSTABLE',
                        reportTitle: 'BDD Test Report',
                        fileIncludePattern: 'tests/bdd/behave-results.json',
                        trendsLimit: 10,
                        classifications: [
                            [key: 'Browser', value: 'Chrome']
                        ]
                }
            }
        }
        
        stage('Build') {
            when {
                expression { currentBuild.result != 'FAILURE' }
            }
            steps {
                script {
                    echo "Building Docker images..."
                    sh '''
                        # Build API image
                        cd microservices/api
                        docker build -t oecd-api:${BUILD_NUMBER} .
                        docker tag oecd-api:${BUILD_NUMBER} oecd-api:latest
                        
                        # Build Frontend image
                        cd ../../frontend/oecd-dashboard
                        docker build -t oecd-frontend:${BUILD_NUMBER} .
                        docker tag oecd-frontend:${BUILD_NUMBER} oecd-frontend:latest
                    '''
                }
            }
        }
        
        stage('Deploy') {
            when {
                expression { currentBuild.result != 'FAILURE' }
            }
            steps {
                script {
                    echo "Deploying to production..."
                    sh '''
                        # Stop existing containers
                        docker-compose -f docker-compose.yml down || true
                        
                        # Deploy new version
                        docker-compose -f docker-compose.yml up -d
                        
                        # Wait for services to be healthy
                        sleep 30
                        
                        # Verify deployment
                        curl -f http://localhost:8000/health || exit 1
                        curl -f http://localhost/ || exit 1
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo "Pipeline completed!"
            // Clean up test environments
            sh '''
                docker system prune -f || true
                rm -rf tests/*/test_env || true
                rm -rf tests/*/ui_test_env || true
                rm -rf tests/*/bdd_env || true
            '''
        }
        success {
            echo "Pipeline succeeded!"
            // Send success notification
        }
        failure {
            echo "Pipeline failed!"
            // Send failure notification
        }
    }
}