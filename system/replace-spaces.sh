#!/bin/bash


case $1  in 
	mv)
		new_name=$(echo $2 | tr ' ' '.');
		mv "$2" $new_name
		;;

	*)	new_name=$(echo $1 | tr ' ' '.');
		;;
esac

echo $new_name
