#! /bin/bash
PROJECT_ID=[[YOUR_PROJECT]]
VERSION=1
TAG=gcr.io/${PROJECT_ID}/demo:cr${VERSION}
docker build ../baseApp/demo -t ${TAG}

docker push ${TAG}
gcloud beta run deploy --image ${TAG} --platform managed --region us-central1