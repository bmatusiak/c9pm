#!/bin/bash

NAME=gae
VERSION=1.7.2
URL=http://googleappengine.googlecode.com/files/google_appengine_$VERSION.zip

wget $URL
unzip google_appengine_$VERSION.zip
rm google_appengine_$VERSION.zip

mkdir -p $HOME/lib/pkg
mv google_appengine $HOME/lib/pkg/$NAME-$VERSION