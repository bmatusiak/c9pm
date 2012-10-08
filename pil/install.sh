#!/bin/bash

NAME=pil
VERSION=1.1.7
URL=http://effbot.org/downloads/Imaging-$VERSION.tar.gz

wget $URL
tar xvfz Imaging-$VERSION.tar.gz
cd Imaging-$VERSION

python setup.py install

cd ..
rm -rf rm Imaging-$VERSION*

