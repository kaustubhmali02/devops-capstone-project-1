#!/bin/bash
if [ "$(docker ps -q -f name=website)" ];then
    echo "Running Countainers. Removing them"
    docker rm -f $(docker ps -q -f name=website)
    if [ "$(docker ps -aq -f status=exited -f name=website)" ]; then
        # cleanup
        docker rm -f $(docker ps -aq -f status=exited -f name=website)
    fi
else
    echo "Din't find any Running Containers"
fi