#!/bin/bash -e

VERSION=1.8.1.3
NAME=git-$VERSION

PKGDIR=$HOME/lib/pkg
DIR=$NAME
mkdir -p $PKGDIR

git clone https://github.com/git/git.git $DIR
cd $DIR
git checkout v$VERSION

echo Building...
make prefix=$HOME/lib/pkg/$NAME all

echo Installing...
make prefix=$HOME/lib/pkg/$NAME install
ln -s $HOME/lib/pkg/$NAME/bin/* $HOME/bin

cd ..
rm -rf $DIR