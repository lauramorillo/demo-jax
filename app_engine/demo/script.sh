#! /bin/bash
gcloud app create --region us-central
mvn -DskipTests package appengine:deploy