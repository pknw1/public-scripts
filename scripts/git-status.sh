#!/bin/bash
find /home -type d -iname '\.git' |while read -r REPO; 
do
	cd $(dirname $REPO)
	git status
done

