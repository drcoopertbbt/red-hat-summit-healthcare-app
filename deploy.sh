#!/bin/bash

# Set the tag to the current timestamp
export TAG=$(date +%s)
echo "TAG is set to $TAG"

# Replace the $TAG variable in the deployment.yaml file and apply the configuration
envsubst < deployment.yaml | oc apply -f -
echo "Applied deployment.yaml with TAG=$TAG"

# Apply the Service
oc apply -f service.yaml
echo "Applied service.yaml"

# Apply the route
oc apply -f route.yaml
echo "Applied route.yaml"