#!/bin/bash

WD=$(dirname $0)
cd ${WD}
cd confs/nginx

TARGET_DIR="/etc/nginx/sites-enabled/"
TARGET_FILE="docker.conf" 
if [ -L ${TARGET_DIR}${TARGET_FILE} ]; then
	sudo rm ${TARGET_DIR}${TARGET_FILE}
	echo "rm ${TARGET_DIR}${TARGET_FILE}"
fi

sudo ln -s $PWD/docker.conf ${TARGET_DIR}
echo "ln -s $PWD/docker.conf ${TARGET_DIR}"

# cd ../dnsmasq
# sudo ln -s $PWD/dnsmasq.conf /etc/
