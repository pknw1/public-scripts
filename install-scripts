#!/bin/bash
HOSTNAME=$1
SCRIPT=$2

function confirm(){
	read -p "Copy Source file(s) over targey? Are you sure? " -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo " "
	    else
		    echo "exit "
		    exit 0
	    fi
    }



if [[ ${HOSTNAME} == "" ]]; 
then
	echo "hostname required"
	exit 99
else
	echo "Target Host : ${HOSTNAME}"
fi

if [[ ${SCRIPT} == "" ]];
then
	echo "Source Scripts : all scripts"
	echo " Lines		Last Updated		Script Name"
	echo "---------------------------------------------------------------------------------------------"
	find . -type f | grep -v ".git" | while read -r fn; do
	echo "	$(wc  -l ${fn} | awk '{print $1}')	| $(stat -c %y ${fn} | awk -F.  '{print $1}') | ${fn}" 
	done
	confirm
	scp -r * $HOSTNAME:/home/public-scripts/	

else
	echo "Source Script : ${SCRIPT}"
	if ! [[ -f "${SCRIPT}" ]]; then
		echo "script does not exist; exiting"
		exit 99
	else
		echo "script ${SCRIPT} "
		echo "$(wc -l ${SCRIPT} | awk '{print $1}') lines"
	       echo "last updtated $(stat -c %y ${SCRIPT})" 
	       echo " "
	fi
	confirm
	scp  ${SCRIPT} $HOSTNAME:/home/public-scripts/	
fi

