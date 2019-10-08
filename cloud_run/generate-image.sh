#! /bin/bash
PROJECT_ID=jax-london-255110 
VERSION=1
TAG=gcr.io/${PROJECT_ID}/demo:cr${VERSION}
docker build ../baseApp/demo -t ${TAG}

docker push ${TAG}
gcloud beta run deploy --image ${TAG} --platform managed --region us-central1