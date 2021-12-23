#!/bin/bash

WD=$(dirname $0)
cd ${WD}
cd nginx

TARGET_DIR="/etc/nginx/sites-enabled/"
TARGET_FILE="docker.conf" 

sudo rm ${TARGET_DIR}/*

sudo ln -s $PWD/docker.conf ${TARGET_DIR}
echo "ln -s $PWD/docker.conf ${TARGET_DIR}"

cd ../
echo "ln -sf $PWD/.gitconfig ~/"
ln -sf $PWD/.gitconfig ~/

# cd ../dnsmasq
# sudo ln -s $PWD/dnsmasq.conf /etc/
