#!/bin/bash

# Creating a volume only if needed
if [ "$(docker volume ls -q -f name=get-target)" ]; then
    echo "Volume: get-target present. Not creating a new one."
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
    --name get-test-output \
    --opt type=none \
    --opt device=/home/jenkins/output/test-output \
    --opt o=bind 
fi