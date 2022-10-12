#!/bin/bash
echo "Hello world"

echo "script args: $0 $1 $2"
export LENNY_VERSION=$1
envsubst < kubernetes/lenny.yaml >> kubernetes/lenny
cat kubernetes/lenny > kubernetes/lenny.yaml
cat kubernetes/lenny.yaml
cat kubernetes/lenny
rm kubernetes/lenny
