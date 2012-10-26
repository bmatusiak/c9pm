#!/bin/bash -e

PKGDIR=$HOME/lib/pkg
mkdir -p $PKGDIR
cd $PKGDIR
wget http://luvit.io/dist/0.5.0/luvit.tar.gz
tar xzf luvit.tar.gz
rm luvit.tar.gz
cd luvit-0.5.0
make
mkdir -p bin
mv build/luvit bin/

ln -s $PKGDIR/luvit-0.5.0/bin/* $HOME/bin