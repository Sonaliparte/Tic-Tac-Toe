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
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t tic-tac-toe-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -d -p 3000:3000 --name tic-tac-toe tic-tac-toe-app'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
    }
}
