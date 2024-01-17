#!/usr/bin/bash

imageName=$(docker images | awk -F ' ' '{print $3}' | tail -n +2)
containerName=$(docker container ps | awk -F ' ' '{print $1}'| tail -n +2)
jenkinsJobName="build-docker-image"

docker container stop $containerName &> /dev/null
docker container rm $containerName &> /dev/null
docker image rm $imageName &> /dev/null

cd docker/docker-examples
docker image build -t $imageName:$BUILD_NUMBER .
