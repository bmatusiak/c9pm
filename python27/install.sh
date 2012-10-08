#!/bin/bash

NAME=python
VERSION=2.7.3
URL=http://www.python.org/ftp/python/$VERSION/Python-$VERSION.tgz

wget $URL
tar xvfz Python-2.7.3.tgz
cd Python-2.7.3 

mkdir -p $HOME/lib/pkg
./configure --prefix=$HOME/lib/pkg/$NAME-$VERSION
make
make install

cd ..
rm -rf Python-$VERSION*

ln -s $HOME/lib/pkg/$NAME-$VERSION/bin/* $HOME/bin