#grep -Pzo "PK.*(\n|.)*details"

START="<item>"
END="</item>"
FILE=$3

cat "$1" | grep -Pzo "${START}.*(\n|.)*${END}"
