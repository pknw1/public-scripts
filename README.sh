
find . -mindepth 2 -type f -iname 'README.md' | while read -r SUBSECT;
do
	echo $SUBSECT
	DIRNAME=$(dirname $SUBSECT | sed 's/\.\///')
	SUB="$(grep "\:TITLE" $SUBSECT|sed 's/\:TITLE\://')"
	DES="$(grep "\:DESCRIPTION" $SUBSECT|sed 's/\:DESCRIPTION\://')"
	STAT="$(grep "\:STATUS" $SUBSECT|sed 's/\:STATUS\://')"
	UPDATED=$(find . -type f -printf '%T@ %Tb %Td %TY %p\n' | sort -n | tail -1 | cut -f2- -d" ")

printf "\n | Directory	| Title		| Updated	|"
printf "\n ----------------------------------------------"
printf "\n |$DIRNAME		$SUB		$UPDATED"
done
