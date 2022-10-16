#!/bin/bash

echo "=== bash script ==="
echo "Hello world"
printenv
echo "Image version: $1"
export IMAGE_VERSION=$1
envsubst < kubernetes/deployment.yaml >> kubernetes/deployment
cat kubernetes/deployment > kubernetes/deployment.yaml
cat kubernetes/deployment.yaml
rm kubernetes/deployment
echo "=== end of bash script ==="