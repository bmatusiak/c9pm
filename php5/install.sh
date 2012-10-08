#!/bin/bash

NAME=php
VERSION=5.4.7
URL=http://nl.php.net/get/php-$VERSION.tar.gz/from/this/mirror

wget $URL
tar xvfz php-$VERSION.tar.gz
cd php-$VERSION

mkdir -p $HOME/lib/pkg
./configure --prefix=$HOME/lib/pkg/php-$VERSION
make
make install

cd ..
rm -rf php-$VERSION*

ln -s $HOME/lib/pkg/$NAME-$VERSION/bin $HOME/bin