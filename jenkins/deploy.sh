#!/bin/bash
echo "Hello world"

# export IMAGE_VERSION=lenmorld/node_app:0.0.${currentBuild.number}
echo "Image version: ${IMAGE_VERSION}"
envsubst < kubernetes/deployment.yaml >> kubernetes/deployment
cat kubernetes/deployment > kubernetes/deployment.yaml
cat kubernetes/deployment.yaml
rm kubernetes/deployment
