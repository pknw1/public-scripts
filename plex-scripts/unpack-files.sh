#!/bin/bash
source functions.sh
REQUIRED_ARGS=1

function help(){
NAME=$(realpath $0 | awk -F/ '{print $NF}')
banner "$NAME"
printf "\n About: locate, unpack and housekeep archives for downloaded media"
printf "\n Arguments: /root/path/to/search"
printf "\n Examples "
printf "\n"
}

if [ ${#} -ne $REQUIRED_ARGS ];
then
	help
	output error "The script expected 1 arguments, but received ${#}"
	exit 2
fi

CURR_DIR=$(pwd)
BASE_DIR=$1

function unrar(){
	cd "${1}"
	find "${1}" -mindepth 1 -maxdepth 1 -type f -iname '*.rar' -exec rar x -o+ "{}" \;
	find . -type f -mmin +5 -iname '*.r??' -delete
}

function unzip(){
	cd "${1}"
	find "${1}" -mindepth 1 -maxdepth 1 -type f -iname '*.zip' -exec unzip -o "{}" \; -exec rm "{}" \;
}

find "${BASE_DIR}" -type f -size +1M | egrep -i '\.zip|\.rar' | while read -r "ARCHIVE";
do
	output success "extracting files in $ARCHIVE"
	unzip "$(dirname "${ARCHIVE}")"
	unrar "$(dirname "${ARCHIVE}")"
done

