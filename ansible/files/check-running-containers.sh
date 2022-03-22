#!/bin/bash
if [[ $(docker ps -a | grep "website" | awk '{print $2}') = website ]];then
    echo "Running Countainers. Stopping them"
    $(docker rm -f $(docker ps -a -f status=exited -f status=created -q))
else
    echo "Din't find any Running Containers"
fi