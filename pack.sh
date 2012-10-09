#!/bin/bash

NAME=$1
PKG=$HOME/lib/pkg/$NAME

if [ ! -d $PKG ] ; then
    echo "USAGE $0 package"
fi

cd $HOME/lib/pkg
rm -rf $NAME.tgz
tar cfz $NAME.tgz $NAME
s3cmd put $NAME.tgz s3://c9_packages
rm $NAME.tgz