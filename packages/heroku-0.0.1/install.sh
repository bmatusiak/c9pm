#!/bin/bash

DEST=~/lib/pkg/heroku-0.0.1

mkdir -p $DEST
cd $DEST
wget --no-check-certificate https://s3-us-west-1.amazonaws.com/c9-deployment-templates/heroku.zip
unzip heroku.zip -d .
rm heroku.zip

ln -s $DEST/heroku ~/bin/heroku

# now update heroku to latest version if available
heroku update

echo -e
echo -e Heroku has been installed
echo -e
echo -e View available commands via:
echo -e \\theroku help