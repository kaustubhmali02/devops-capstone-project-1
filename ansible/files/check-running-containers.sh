#!/bin/bash
if [ "$(docker ps -q -f name=website)" ];then
    echo "Running Countainers. Removing them"
    docker rm -f website
else
    echo "Din't find any Running Containers"
fi