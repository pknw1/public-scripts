#!/bin/bash
HOSTS="192.168.10.30 192.168.10.31 91.121.78.68 5.196.71.114"
HOSTS="dev dockerdev ks win"
HOSTNAME=$(hostname)
MODIFIED=$(find ~/.ssh/ -type f -iname config -mmin -2)
RUNTIME=$(date +%s)

if [[ $MODIFIED ]]; then
	echo OK to proceed
else
	echo "local ssh config not updated in last2 mins"
	exit 99
fi

case $HOSTNAME in
	PDC) echo PDC 
		for H in $HOSTS; 
		do
			echo $H
			ssh $H "cp /root/.ssh/config /root/.ssh/config-${RUNTIME}"
			scp ~/.ssh/config $H:/root/.ssh/config
		done
		;;
	ns3046440) echo KS 
		for H in $HOSTS;
		do
			echo $H
			ssh $H "cp /root/.ssh/config /root/.ssh/config-${RUNTIME}"
		done
		;;
	dev) echo "commit to repo and run from PDC or KS" ;;
	*) echo "not on valid host" && exit 99 ;;
esac

	
