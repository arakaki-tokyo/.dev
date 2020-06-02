#!/bin/bash

if [ ! $1 ]; then
	NAME=a1
else
	NAME=$1
fi

docker run -it \
	--name $NAME \
	-v /home/atrenew/apps/anaconda/mnt:/opt/notebooks \
	continuumio/anaconda3:2020.02 \
	/opt/conda/bin/jupyter notebook \
	--notebook-dir=/opt/notebooks \
	--allow-root \
	--ip='0.0.0.0' \
	--port=80 \
	--no-browser \
	--NotebookApp.token='' \
	--NotebookApp.password='' \

