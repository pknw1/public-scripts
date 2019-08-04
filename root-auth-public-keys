#!/bin/bash

if [[ "$#" -eq "0" ]];
then
	echo "you must specify home folder, such as /root or /home/userface"
	echo " "
	exit 99
	else
		HOMEPATH="$1"
	fi

echo ${HOMEPATH}

if ! [[ -d ${HOMEPATH} ]]; then echo "No such user home"; exit 99; fi
if ! [[ -d ${HOMEPATH}/.ssh/ ]]; then mkdir -p ${HOMEPATH}/.ssh; fi

cat  >> "${HOMEPATH}/.ssh/authorized_keys" << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCs4RPSAs5pZn5ypyy2rpgzU9h3YrTnlu1jzi4MG4q6dSE1QZIjfGhJE859kHbY9ackoa8Jtt/D0KG6YKsw35TfJmeoj8zUthcm4pZt0WC5YLU8/LHzxnA5I5InmTM/djGBvlkBqWwhljM0kXuf1xBv9XPPZSjdwb5ocp1LOhoLeHjV3blT7RndGtXuREhjt+id860a4zdpWyH2pBPD+f6G5nWcakfIxGbTyCQzjmREkJVy5thxK3palDEf9VV7a5rbLFPFOYKDPgm0bPOLAred+GLCV8Cnzjy36BzWDt9n73QKcBB7SoGvxPLFIb2CIjfKVSne5MRyZ5IMgh5TjGIb root@ns3046440
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMothcQ2MLFARp++5hX0L0gXfr8uC/nKhrxIAqP9mjMHOuQE7jxRTwam2LK1B9H71hn2nZlYjs1Z3Rh+4hL8e/CIL/1KNE3VkGXGx7/uGB3DkC61Rw/MS72vEGJE/jVHCjyF5ZprhkSyfhS8C25RBMZ3DwicY0btLtAYyuPXanOpWDOaeZ+ZORXEvrI5ZBzhGwVqh3B6plHD+cAjZ5tGqnmqeBqOlt+TUh5hhg/f3Een6x759GiUpTfxCzjIqYSOyC7z2KZbu3URg2vhY2xhsHLrFfQxFh02rLKSJB/0v/eX/3I9Bj7Dy1rdj4Vidzp1g+EYmpfmevIEKbkjEHpLN1 pknw1@DESKTOP-CF1AAHE
EOF
