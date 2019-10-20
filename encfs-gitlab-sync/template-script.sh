#!/bin/bash
source functions.sh
REQUIRED_ARGS=2

function help(){
NAME=$(realpath $0 | awk -F/ '{print $NF}')
banner "$NAME"
printf "\n About: "
printf "\n Arguments: "
printf "\n Examples "
printf "\n"
}

if [ ${#} -ne $REQUIRED_ARGS ];
then
	help
	output error "The script expected 2 arguments, but received ${#}"
	exit 2
fi
