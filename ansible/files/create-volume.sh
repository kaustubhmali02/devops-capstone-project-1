#!/bin/bash

# Creating a volume only if needed
if [ "$(docker volume ls -q -f name=get-output)" ]; then
    echo "Volume: get-output present. Not creating a new one."
else 
    echo "Creating a volume for retriving the website-selenium-test output and jar file"
    docker volume create \
    --name get-output
    --opt type=none
    --opt device=/home/jenkins/output
    --opt o=bind
fi

