#!/bin/bash


if [ $# -ne 1 ]; then 
	read -p "Please enter either all/stopped/runnuing to get containers: " ARG;
else
	ARG=$1;
fi


case $ARG in
	all) docker ps -aq | while read -r id; do echo $(docker inspect -f {{.Name}} $id) $(docker inspect -f {{.State.Status}} $id); done	
		;;
	stopped) docker ps -q -f "status=exited" | while read -r id; do echo $(docker inspect -f {{.Name}} $id); done;
		;;
	running) docker ps -q -f "status=running" | while read -r id; do echo $(docker inspect -f {{.Name}} $id); done
		;;
	*) invalid response - exiting
		;;
esac


