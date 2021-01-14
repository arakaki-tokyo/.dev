#!/bin/bash

if [ ! $1 ]; then
	NAME=a1
else
	NAME=$1
fi

docker run -dit --name $NAME \
	-v $PWD/mnt/log:/var/log/nginx \
	-v $PWD/mnt/conf/conf.d/nginx.conf:/etc/nginx/nginx.conf \
	--net mynet \
	--ip 172.18.0.83 \
	nginx:stable-alpine
