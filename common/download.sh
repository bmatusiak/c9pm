#!/bin/bash -e

PACKAGE=$1

FILE=$PACKAGE.tgz
URL=https://s3.amazonaws.com/c9_packages/$FILE

mkdir -p $HOME/lib/pkg
cd $HOME/lib/pkg

wget $URL -O $FILE
tar xfz $FILE
rm $FILE

ln -s $HOME/lib/pkg/$PACKAGE/bin/* $HOME/bin