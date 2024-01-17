#!/bin/bash

image_vers=$(cat ../image_vers)
containerName="weather_app_container"
docker container run -d --name $containerName -p 8000:3000 node_image:$image_vers
