# WSO2 Micro Gateway CI/CD Project Example
This is a project example on how to have simple CI/CD for Micro-Gateway projects.

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

