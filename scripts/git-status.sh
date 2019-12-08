#!/bin/bash
find /home -type d -iname '\.git' |while read -r "REPO"; 
do
	cd $(dirname "$REPO")
	UNTRACKED=$(git status | grep Untracked)

	if [[ -z $UNTRACKED ]]; then 
		#echo "$REPO OK" 
		TEST=1
	else
		echo "$REPO Fail"
	fi
done

