# WSO2 Micro Gateway CI/CD Project Example
This is a project example on how to have simple CI/CD for Micro-Gateway projects.

This project is using the Micro Gateway Toolkit 3.1.0.

The Travis CI CI/CD process will:
1. Checkout the Code from the github repo;
2. Install the gcloud SDK and the credentials required to use it;
3. Configure the gcloud SDK to connect to the Kubernetes Cluster created in GCP;
4. Build the Micro Gateway project with the flags to generate a Docker Image;
5. Push the Generated Image to Docker Hub in the account configured in the build settings;
6. Apply the Kubernetes artifacts into the GCP cluster: a Deployment using the image generated and a service exposing the Pod via LoadBalancer in the port 9090;

# Required Environment Variables 

* DOCKER_USERNAME: Docker Hub username to push the image to;
* DOCKER_PASSWORD: Docker Hub password to push the image to;
* GCLOUD_SERVICE_KEY_STG: Base64 string of the service account json key. e.g: base64 project-name-abcxyz123.json
* GCLOUD_PROJECT: Google Cloud Project Name;
* GCLOUD_ZONE: Google Cloud Zone;
* GCLOUD_CLUSTER: Google Cloud Kubernetes Cluster Name;

# How To Use It

In order to have this project to run we need to:

* Fork the Repo to your account;
* Create a TravisCI Build project pointing to your repo;
* Created the Required Environment Variables described above in the Build Settings;
* Add the Swagger Definition for the API you wanted to expose in the Micro Gateway inside the **myapi/api_definitions** folder;

# Improvements

* Enable caching for gcloud sdk and micro-gw toolkit;
