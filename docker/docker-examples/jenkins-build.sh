#!/usr/bin/bash

docker container stop weather_app
docker container rm weather_app
docker image rm node_image:$(cat ../image_vers)

cd docker/docker-examples
docker image build -t node_image:$BUILD_NUMBER .

cd /var/lib/jenkins/build-docker-image
echo $BUILD_NUMBER > image_vers
echo $BUILD_NUMBER > ../image_vers
