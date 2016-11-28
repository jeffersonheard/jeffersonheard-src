#!/bin/bash

MSG=$1
hugo
git add .
git commit -m "$MSG"
git push origin master
rsync -avz --delete public/* /Users/jeff/Sites/jeffersonheard.github.io/*
pushd $PWD
cd /Users/jeff/Sites/jeffersonheard.github.io
git add .
git commit -m "$MSG"
git push origin master
