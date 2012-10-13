#!/bin/bash

DEST=~/lib/pkg/heroku-latest

mkdir -p $DEST
cd $DEST
wget --no-check-certificate https://s3-us-west-1.amazonaws.com/c9-deployment-templates/heroku.zip
unzip heroku.zip -d .
rm heroku.zip

ln -s $DEST/heroku ~/bin/heroku