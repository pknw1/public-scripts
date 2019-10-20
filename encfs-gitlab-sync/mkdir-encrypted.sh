#!/bin/bash
source ../functions.sh
REQUIRED_ARGS=1
export REALDIR=$(realpath $1)
export ENCDIR=$(echo $REALDIR | rev | sed 's/\//\.\//' | rev)
echo $REALDIR
echo $ENCDIR

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


function check_exists(){
	if [[ -d $REALDIR ]]; then output error "Folder already exists"; exit 2; fi
}

function make_folders(){
	mkdir -p $REALDIR || output error "Folder already exists" && exit 99
	mkdir -p "$ENCDIR" || output error "Encrypted folder already exists" && exit 99
}

function create(){

echo "y
y
x
2
128
4096
2
n
n
n
0
y

" | encfs $ENCDIR $REALDIR #encfs $(pwd)/.${1} $(pwd)/${1} 

	STAMP=$(date +%s)
	VAR=$(echo $STAMP | base32)
	read -p "  Enter your decryption password to store for automount: " RESPONSE
	echo export ${VAR:1:8}=$RESPONSE >> ~/.profile

	echo encfs --public --extpass="echo \$${VAR:1:8}" $ENCDIR $REALDIR >> $ENCDIR/mount-folder.sh
        chmod +x $ENCDIR/mount-folder.sh
	echo $ENCDIR/mount-folder.sh  >> ~/.profile
}

check_exists $1
create $1
