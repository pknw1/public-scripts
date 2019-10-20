#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
USER_LOG=$HOME/user.log


function banner(){
	echo " "
	figlet -f pk.flf "$1"
}

function help(){
	banner "Help"
	echo $1
	exit 99
}

function output() {
	case $1 in
		error) 		FONT=$RED;;
		message)	FONT=$NC;;
		success)	FONT=$GREEN;;
	esac

	printf "\n${FONT}${2}\n${NC}\n"
	echo $(date +'%d-%m-%Y %H:%M:%S') - $(whoami) - $(realpath ${0}) - "$2" >> $USER_LOG
}


function check_args(){
	if ! [[ $1 == $2 ]];
	then
	output error "The script requires ${1} arguments but was supplied with ${2}"
fi
}
