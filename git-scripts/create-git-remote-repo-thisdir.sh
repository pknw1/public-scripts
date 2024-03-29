#!/bin/bash
USERNAME=$(whoami)
MYNAME=$0
MYPWD=$(pwd)
MYDATE=$(date)
REPO=$(pwd | awk -F/ '{print $NF}' | tr '[:upper:]' '[:lower:]')
GROUP=$(pwd | awk -F/ '{print $(NF-1)}')

case $GROUP in
        web)            export GID=5910336;
                ;;
        docker)         export GID=5910293;
                ;;
        shell)          export GID=5910295;
                ;;
        vbl)            export GID=5910332;
                ;;
        *)              export GID=5910913; export GROUP=misc
                ;;
esac

# GID 5910292   pknw1-dev
# GID 5910336   web
# 5910293       docker
# 5910295       shell

#if ! [[ $GID ]]; then echo set export GID=123456 to set the parent group for the repo; exit 99; fi
#if ! [[ $GROUP ]]; then echo set export GROUP=web to set the parent group name for the repo; exit 99; fi
if ! [[ $TOKEN ]]; then echo set export TOKEN=123455 to set the Gitlab Personal Token; exit 99; fi


echo $MYDATE $USERNAME"@"$MYPWD/$MYNAME  $1 $2 $3

if ! [[ -d "./.git" ]]
then
        echo no git dir
        curl -H "Content-Type:application/json" https://gitlab.com/api/v4/projects?private_token=$TOKEN -d "{ \"name\": \"$REPO\", \"namespace_id\" : \"$GID\" } "
        git init
        git add .
        git remote add origin git@gitlab.com:pknw1-dev/${GROUP}/${REPO}.git
        git commit -m  "$(date)"
        git push -u origin master
else
        git add .
        git commit -m "$(date +%s)"
        git push -u origin master
fi
