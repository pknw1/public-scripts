#!/bin/bash
ROOT_PATH=/home/dev/build-deb

if ! [ -d $ROOT_PATH ]; then mkdir -p $ROOT_PATH; fi

function logo(){
	clear
echo " "
echo " ██████╗██████╗ ███████╗ █████╗ ████████╗███████╗       ██████╗ ███████╗██████╗ ";
echo "██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██╔════╝       ██╔══██╗██╔════╝██╔══██╗ ";
echo "██║     ██████╔╝█████╗  ███████║   ██║   █████╗         ██║  ██║█████╗  ██████╔╝ ";
echo "██║     ██╔══██╗██╔══╝  ██╔══██║   ██║   ██╔══╝         ██║  ██║██╔══╝  ██╔══██╗ ";
echo "╚██████╗██║  ██║███████╗██║  ██║   ██║   ███████╗    ██╗██████╔╝███████╗██████╔╝ ";
echo " ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚═╝╚═════╝ ╚══════╝╚═════╝ ";
echo " "

}

logo

if [[ $# -eq 0 ]];
then
        read -p "What is the package name? : "  PACKAGENAME
else
        PACKAGENAME=$1
fi

if [ -d $ROOT_PATH/$PACKAGENAME ]; then
	find $ROOT_PATH/$PACKAGENAME -mindepth 1 -maxdepth 1 -type d | awk -F/ '{print $NF}'
	echo " "
fi

read -p "What is the version number? : " VERSION
read -p "What are the dependencies? : " DEPENDS
read -p "What is the description? : " DESCRIPTION

if [ -z "$DESCRIPTION" ]; then
	DESCRIPTION="no description was entered"
fi

THIS_BUILD=$ROOT_PATH/$PACKAGENAME/"$PACKAGENAME"-"$VERSION"
echo $THIS_BUILD
if ! [ -d $THIS_BUILD ]; then mkdir -p $THIS_BUILD/DEBIAN; fi

cat >> $ROOT_PATH/$PACKAGENAME/"$PACKAGENAME"-"$VERSION"/DEBIAN/control <<EOF
Package: $PACKAGENAME
Architecture: all
Maintainer: PKNW1
Depends: $DEPENDS
Priority: optional
Version: $VERSION
Description: $DESCRIPTION
EOF

while read -e -p "Input files for copying (just hit enter to finish build) : " FILENAME; do
if [ -z $FILENAME ]; then
        break
fi

		echo $FILENAME
		ROOTDIR=$ROOT_PATH/$PACKAGENAME/"$PACKAGENAME"-"$VERSION"$(dirname ${FILENAME})
		mkdir -p $ROOTDIR
		cp -r $FILENAME $ROOTDIR/
done

cd $ROOT_PATH
dpkg-deb --build $PACKAGENAME/"$PACKAGENAME"-"$VERSION"
