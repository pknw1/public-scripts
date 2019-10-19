#!/bin/bash

	function logo(){
		        echo " "


			echo " ██████╗ ██╗████████╗██╗      █████╗ ██████╗ ███████╗██╗   ██╗███╗   ██╗ ██████╗";
			echo "██╔════╝ ██║╚══██╔══╝██║     ██╔══██╗██╔══██╗██╔════╝╚██╗ ██╔╝████╗  ██║██╔════╝";
			echo "██║  ███╗██║   ██║   ██║     ███████║██████╔╝███████╗ ╚████╔╝ ██╔██╗ ██║██║     ";
			echo "██║   ██║██║   ██║   ██║     ██╔══██║██╔══██╗╚════██║  ╚██╔╝  ██║╚██╗██║██║     ";
			echo "╚██████╔╝██║   ██║   ███████╗██║  ██║██████╔╝███████║   ██║   ██║ ╚████║╚██████╗";
			echo " ╚═════╝ ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═══╝ ╚═════╝";
			echo "                                                                                ";

									}
cd $(dirname $0)
if ! [[ -d ./.git ]]; then clear; logo; echo "No Git Directory"; exit 99; fi

if [[ -z $(git status | grep "nothing to commit") ]]; 
then
	clear
	logo
	git add . || echo "Error Adding Files"
	git commit -m "$(date)" || echo "Error Commiting Files"
	git push || echo "Error Pushing Files"
	echo " "
	echo "Synced Updates"
	exit 0
else
	logo
	echo nothing to commit
	exit 0
fi
