#! /bin/bash
BUCKET_NAME=laura-jax-demo
JAR_NAME=demo-0.0.1-SNAPSHOT.jar
VM_NAME=demov1 

mvn install -f ../baseApp/demo/pom.xml
gsutil cp ../baseApp/demo/target/${JAR_NAME} gs://${BUCKET_NAME}/${JAR_NAME}

gcloud compute firewall-rules create ${VM_NAME}-allow-http-8080 \
    --allow tcp:8080 \
    --source-ranges 0.0.0.0/0 \
    --target-tags ${VM_NAME} \
    --description "Allow port 8080 access to http-server"

gcloud compute instances create ${VM_NAME} \
    --image-family=debian-8 \
    --image-project=debian-cloud \
    --machine-type=g1-small \
    --metadata-from-file startup-script=./startup.sh \
    --zone us-central1-f \
    --tags ${VM_NAME}
    