#!/bin/bash

NAME=php
VERSION=5.4.7
URL=https://s3.amazonaws.com/c9_packages/$NAME-$VERSION.tgz

mkdir -p $HOME/lib/pkg
cd $HOME/lib/pkg

wget $URL
tar xvfz $NAME-$VERSION.tar.gz
rm -rf php-$VERSION*

ln -s $HOME/lib/pkg/$NAME-$VERSION/bin/* $HOME/bin