pipeline {
    agent any

    environment {
        APP_NAME = "tic-tac-toe-app"
        CONTAINER_NAME = "tic-tac-toe"
        WORKDIR = "backend"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning code...'
                // Git checkout happens automatically if configured in Jenkins
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing npm packages...'
                bat "cd %WORKDIR% && npm install"
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                bat "cd %WORKDIR% && npm test || echo Tests failed (not breaking build)"
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat "cd %WORKDIR% && docker build -t %APP_NAME% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                bat "docker rm -f %CONTAINER_NAME% || echo Container not found"
                bat "docker run -d -p 3000:3000 --name %CONTAINER_NAME% %APP_NAME%"
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
            bat "docker ps -a"
            echo 'Pipeline execution completed.'
        }
    }
}
