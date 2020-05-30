#!/bin/bash

cd $(dirname $0)
cd ../nginx
sudo ln -s $PWD/docker.conf /etc/nginx/sites-enabled/

cd ../dnsmasq
sudo ln -s $PWD/dnsmasq.conf /etc/
