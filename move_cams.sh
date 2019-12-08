#!/bin/bash
find /aws/movies -type f -iname '*CAM*' | while read -r "FILE"
do
	PARENT=$(echo "${FILE}" | awk -F/ '{print $4}')
	echo "$PARENT"
	read -p "Move file : " TEST
	echo " "
done
