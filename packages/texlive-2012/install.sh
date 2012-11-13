#!/bin/bash

DEST=$HOME/lib/pkg/texlive

mkdir -p $DEST
cd $DEST

# grab it dude
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xvfz install-tl-unx.tar.gz
rm install-tl-unx.tar.gz

cd install-tl*
TEXLIVE_INSTALL_PREFIX=$DEST ./install-tl -scheme basic

ln -sf $DEST/2012/bin/x86_64-linux/* $HOME/bin/