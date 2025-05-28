pipeline {
    agent any

    environment {
        APP_NAME = "tic-tac-toe-app"
        CONTAINER_NAME = "tic-tac-toe"
        WORKDIR = "backend"
    }

    stages {
        stage('Verify npm') {
            steps {
                bat 'where npm'
                bat 'npm -v'
                bat 'node -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat "cd %WORKDIR% && call npm install"
            }
        }

        stage('Run Tests') {
            steps {
                bat "cd %WORKDIR% && call npm test || echo Tests failed (not breaking build)"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "cd %WORKDIR% && docker build -t %APP_NAME% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker rm -f %CONTAINER_NAME% || echo Container not found"
                bat "docker run -d -p 3000:3000 --name %CONTAINER_NAME% %APP_NAME%"
            }
        }
    }

    post {
        always {
            bat "docker ps -a"
        }
    }
}
