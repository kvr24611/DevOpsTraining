#!/bin/bash

image_version=$(cat ../image_version)
containerName="tomcat_container"
docker container run -d --name $containerName -p 8000:3000 node_image:$image_version
