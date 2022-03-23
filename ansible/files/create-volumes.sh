#!/bin/bash

# Creating a volume only if needed
if [ "$(docker volume ls -q -f name=get-output)" ]; then
    echo "Volume: get-output present. Not creating a new one."
else 
    echo "Creating a volume for retriving the jar files"
    docker volume create \
    --name get-target \
    --opt type=none \
    --opt device=/home/jenkins/output/java \
    --opt o=bind
fi

if [ "$(docker volume ls -q -f name=get-test-output)" ]; then
    echo "Volume: get-test-output present. Not creating a new one."
else
    echo "Creating a volume for retriving the test-result files"
    docker volume create \
    --name get-test-result \
    --opt type=none \
    --opt device=/home/jenkins/output/test-results \
    --opt o=bind 
fi