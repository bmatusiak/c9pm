#!/bin/bash

DEST=~/lib/pkg/perl-5.16.2

mkdir -p $DEST
cd $DEST
wget --no-check-certificate http://s3.amazonaws.com/c9_packages/perl-5.16.2.zip
unzip perl-5.16.2.zip -d .
rm perl-5.16.2.zip

ln -s $DEST/bin/perl ~/bin/perl