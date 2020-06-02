#!/bin/bash

if [ ! $1 ]; then
	NAME=f1
else
	NAME=$1
fi

docker run -it --rm \
	--name $NAME \
	-v $PWD/mnt:/srv \
	-h flask \
	flask:0515 \
	/srv/app.py
  #bash
