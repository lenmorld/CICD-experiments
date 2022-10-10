#!/bin/bash
echo "Hello world"

export LENNY_VERSION=0.20.49
envsubst < kubernetes/lenny.yaml >> kubernetes/lenny
cat kubernetes/lenny > kubernetes/lenny.yaml
cat kubernetes/lenny.yaml
