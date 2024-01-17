#!/usr/bin/bash

imageName="node_image"
containerName="weather_app_container"
jenkinsJobName="build-docker-image"

docker container stop $containerName
docker container rm $containerName
docker image rm $imageName:$(cat ../image_vers)

cd docker/docker-examples
docker image build -t $imageName:$BUILD_NUMBER .

cd /var/lib/jenkins/workspace/$jenkinsJobName
#echo $BUILD_NUMBER > image_vers
echo $BUILD_NUMBER > ../image_vers
