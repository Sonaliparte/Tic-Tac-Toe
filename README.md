 # Full CI/CD Pipeline for Tic-Tac-Toe App with Jenkins, Docker, and Cloud Run

 This project demonstrates a complete CI/CD pipeline that I implemented for deploying a
 Node.js-based Tic-Tac-Toe game. The pipeline includes automated testing, Docker image 
 creation, container registry upload, and deployment to Google Cloud Run — all triggered
 by a simple *git push*.

 ## Tech Stack
- *Jenkins* – CI/CD automation

- *Node.js + npm* – Backend application

- *Docker* – Containerization

- *Google Container Registry (GCR)* – Image storage

- *Google Cloud Run* – Serverless deployment

## Architecture
![image](https://github.com/user-attachments/assets/c0e8925b-7b5c-4854-a2e6-8716c6d86da4)

  
## CI/CD Pipeline Flow
1. *Code Push to GitHub*
Every time I push code to the main branch, Jenkins automatically triggers the pipeline.

2. *Install Dependencies & Run Tests*
Jenkins runs npm install and npm test inside the backend folder to ensure the code works as expected.

3. *Build Docker Image*
Jenkins builds a Docker image of the backend using a Dockerfile.

4. *Push to Google Container Registry (GCR)*
The Docker image is tagged and pushed to GCR using the gcloud CLI and service account authentication.

5. *Deploy to Google Cloud Run*
Finally, the new image is deployed to Cloud Run, making the app live within seconds.

## commands that I use 
1. *Build the Docker Image*: docker build -t gcr.io/festive-bloom-461305-f2/tic-tac-toe .

2.  *Test Locally*: docker run -p 5000:5000 gcr.io/festive-bloom-461305-f2/tic-tac-toe

3. *Push Docker Image to Google Container Registry (GCR)*: docker push gcr.io/festive-bloom-461305-f2/tic-tac-toe

4. *Deploy to Google Cloud Run*: gcloud run deploy tic-tac-toe \
  --image gcr.io/festive-bloom-461305-f2/tic-tac-toe \
  --platform managed \
  --region asia-south1 \
  --allow-unauthenticated

## What I Learned
- How to automate deployments with Jenkins

- How to containerize applications using Docker

- How to push Docker images in GCR

- How to deploy on Google Cloud Run

- Real-world CI/CD experience applicable to professional DevOps workflows

## Ideal For
- DevOps practice projects

- Resume/portfolio demonstrations

- Serverless app deployment on Google Cloud
