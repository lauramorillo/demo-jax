#! /bin/bash
PROJECT_ID=jax-london-255110 
VERSION=1
TAG=gcr.io/${PROJECT_ID}/demo:gke${VERSION}
docker build ../baseApp/demo -t ${TAG}

docker push ${TAG}

gcloud container clusters create demo-cluster --zone us-central1-f
gcloud container clusters get-credentials demo-cluster --zone us-central1-f

kubectl apply -f ./deployment.yaml
kubectl apply -f ./service.yaml