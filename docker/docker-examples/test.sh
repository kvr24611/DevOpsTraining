#!/usr/bin/bash

imageName="node_image"
containerName="weather_app_container"
jenkinsJobName="build-docker-image"




docker container stop $(docker container ps | awk -F ' ' '{print $1}'| tail -n +2) &> /dev/null
docker container rm $(docker container ps | awk -F ' ' '{print $1}'| tail -n +2) &> /dev/null
docker image rm $(docker images | awk -F ' ' '{print $3}' | tail -n +2) &> /dev/null

cd docker/docker-examples
docker image build -t $imageName:$BUILD_NUMBER .

cd /var/lib/jenkins/workspace/$jenkinsJobName
echo $BUILD_NUMBER > ../image_vers
