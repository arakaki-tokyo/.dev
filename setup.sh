#!/bin/bash

cd $(dirname $0)
cd ../nginx

TARGET_DIR="/etc/nginx/sites-enabled/"
TARGET_FILE="docker.conf" 
echo ${TARGET_DIR}${TARGET_FILE}
if [ -L ${TARGET_DIR}${TARGET_FILE} ]; then
	sudo rm ${TARGET_DIR}${TARGET_FILE}
fi

sudo ln -s $PWD/docker.conf ${TARGET_DIR}

# cd ../dnsmasq
# sudo ln -s $PWD/dnsmasq.conf /etc/
