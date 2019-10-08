#! /bin/bash

BUCKET_NAME=laura-jax-demo
JAR_NAME=demo-0.0.1-SNAPSHOT.jar

sudo su -

apt-get update
sudo apt install default-jre -y

mkdir /opt/demo

gsutil cp gs://${BUCKET_NAME}/${JAR_NAME} /opt/demo/${JAR_NAME}
java -jar /opt/demo/${JAR_NAME} &
exit
