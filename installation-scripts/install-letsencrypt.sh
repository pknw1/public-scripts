#!/bin/bash

apt-get update
apt-get install software-properties-common
add-apt-repository universe
add-apt-repository ppa:certbot/certbot
apt-get update
apt-get install -y certbot
 
wget -O /usr/local/bin/ssl-cert https://raw.githubusercontent.com/pknw1/public-scripts/master/scripts/ssl-cert
chmod +x /usr/local/bin/ssl-cert
