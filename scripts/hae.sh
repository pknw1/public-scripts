#!/bin/bash
DIR=$(pwd)
vi /etc/haproxy/haproxy.cfg 
OK=$(haproxy -f /etc/haproxy/haproxy.cfg -c )

case $OK in
	"Configuration file is valid")
		echo ok
		cd /etc/haproxy
		git add . && git commit -m "$(date)" && git push
		service haproxy restart
		cd $DIR
		;;
	*) 
		echo broke
		clear
		haproxy -f /etc/haproxy/haproxy.cfg | grep -v "WARNING"
		;;
esac
