#!/bin/bash

NAME=python
VERSION=2.7.3
FILE=$NAME-$VERSION.tgz
URL=https://s3.amazonaws.com/c9_packages/$FILE

mkdir -p $HOME/lib/pkg
cd $HOME/lib/pkg
pwd

wget $URL -O $FILE
tar xvfz $FILE
rm $FILE

ln -s $HOME/lib/pkg/$NAME-$VERSION/bin/* $HOME/bin