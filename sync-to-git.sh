#!/bin/bash

if [[ -z $(git status | grep "nothing to commit") ]]; 
then
	echo commit
else
	echo nothing to commit
fi
