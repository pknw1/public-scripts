#!/bin/bash
GID=6330792

REPOT="$(hostname)-$(whoami)$(pwd)"
REPO=$(echo $REPOT | tr '/' '-')
echo $REPO
exit
## if the user has previously declined, then this islogged and no further prompts issued

if [[ -f ~/.encrypted-declined ]]; then exit 0; fi

function logo(){
	echo " "

	echo "███████╗███╗   ██╗ ██████╗██████╗ ██╗   ██╗██████╗ ████████╗███████╗██████╗     ███████╗██╗██╗     ███████╗███████╗";
	echo "██╔════╝████╗  ██║██╔════╝██╔══██╗╚██╗ ██╔╝██╔══██╗╚══██╔══╝██╔════╝██╔══██╗    ██╔════╝██║██║     ██╔════╝██╔════╝";
	echo "█████╗  ██╔██╗ ██║██║     ██████╔╝ ╚████╔╝ ██████╔╝   ██║   █████╗  ██║  ██║    █████╗  ██║██║     █████╗  ███████╗";
	echo "██╔══╝  ██║╚██╗██║██║     ██╔══██╗  ╚██╔╝  ██╔═══╝    ██║   ██╔══╝  ██║  ██║    ██╔══╝  ██║██║     ██╔══╝  ╚════██║";
	echo "███████╗██║ ╚████║╚██████╗██║  ██║   ██║   ██║        ██║   ███████╗██████╔╝    ██║     ██║███████╗███████╗███████║";
	echo "╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝        ╚═╝   ╚══════╝╚═════╝     ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝";
	echo "                                                                                                                   ";

}

function about() {
	logo

	echo " Checks for local folder ./encrypted and mounts it to ./.encrypted "
	echo " If they do not exist, optionally they can be setup "
	echo " This file is intended to run on login for users "
	echo " This file requires no paramaters, but relies on HOME variable being set and the resut of whoami"
	echo " "
}

function create_encrypted_git(){
	echo "create git repo in ./.encrypted"
	cd $1
	if [[ -d ./git ]]; then exit 99; fi

	curl -H "Content-Type:application/json" https://gitlab.com/api/v4/projects?private_token=$TOKEN -d "{ \"name\": \"$REPO\", \"namespace_id\" : \"$GID\" } "
	git init
	git add .
	git remote add origin git@gitlab.com:pknw1-servers/ns3046440/encrypted-user-folders/${REPO}.git
	git commit -m  "$(date)"
	git push -u origin master

	echo "add hourly repo sync to git in crontab"

	crontab -l > ~/mycron
	echo "0 * * * * /home/dev/public_scripts/git-commit-user-encrypted.sh" >> ~/mycron
	crontab ~/mycron
	rm ~/mycron
}


function create_encrypted() {

	about

	read -p "  No Encrypted Folder Exists: Should we create the encrypted fodlers and mount now? [Y/N] : " RESPONSE
	CREATE=$(echo $RESPONSE | tr '[[:lower:]]' '[[:upper:]]')

	if [[ "$CREATE" == "Y" ]]; then

		echo "y
		y
		p
		" | encfs $(pwd)/.encrypted $(pwd)/encrypted && cp $(pwd)/.encrypted/.encfs6.xml ~
		create_encrypted_git	
	else

		echo "encrypted userfiles declined $(date)" >> ~/.encrypted-declined
		exit 0
	fi

}


function mount_encrypted_folder(){
	if ! [[ -z $ENCFSPASS ]]; then read -p "  ENCFSPASS not set on login; enter password or CTRL-C to quit : " ENCFSPASS; fi
	encfs --public --extpass="echo $ENCFSPASS" $HOME/.encrypted $HOME/encrypted
}
create_encrypted_git
if ! [ -d ~/.encrypted ]; then create_encrypted; fi
if ! [[ -z $CHECK_MOUNTED ]]; then mount_encrypted_folder && logo && echo "message" ; else clear; logo; echo "Encrypted folders mounted"; fi

