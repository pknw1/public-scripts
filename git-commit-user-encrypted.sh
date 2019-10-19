#!/bin/bash
cd ~/.encrypted || exit 99
git add .
git commit -m "$(date)"
git push -u origin master
