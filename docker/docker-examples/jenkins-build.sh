#!/usr/bin/bash

cd docker/docker-examples
docker image build -t node_image:$BUILD_NUMBER .
