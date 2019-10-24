#!/bin/bash
DIR=$(pwd)
find $1 -type f -iname config | while read -r file
do
	url=$(egrep gitlab $file)
	if [[ "$url" ]];
	then
		repo_path=$(echo $file | sed 's/\.git\/config//g')
		echo $repo_path
		echo $repo_path >> $1/repositories
		#cd $repo_path 
		#git config --global user.name "PK"
		#git config --global user.email pk@pknw1.co.uk
		#git add . && git commit -m "$(date)" && git push
	fi
done


