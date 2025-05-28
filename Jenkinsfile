pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning code...'
                // Automatically done if using Git integration
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing npm packages...'
                bat 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t tic-tac-toe-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                bat 'docker run -d -p 3000:3000 --name tic-tac-toe tic-tac-toe-app'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
