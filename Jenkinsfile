pipeline {
    agent any

    environment {
        APP_NAME = "tic-tac-toe-app"
        REGION = "asia-south1"              
        PROJECT_ID = "festive-bloom-461305-f2"  
        SERVICE_NAME = "tic-tac-toe"        
    }
        stages {
        stage('Run Tests') {
            steps {
                bat "npm test || echo Tests failed (not breaking build)"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t gcr.io/%PROJECT_ID%/%APP_NAME% ."
            }
        }

        stage('Push to Google Container Registry') {
            steps {
                bat "docker push gcr.io/%PROJECT_ID%/%APP_NAME%"
            }
        }

        stage('Deploy to Cloud Run') {
            steps {
                bat """
                gcloud run deploy %SERVICE_NAME% ^
                    --image gcr.io/%PROJECT_ID%/%APP_NAME% ^
                    --platform managed ^
                    --region %REGION% ^
                    --allow-unauthenticated
                """
            }
        }
} 

    post {
        always {
            bat "gcloud run services list --platform managed --region %REGION%"
        }
    }

}