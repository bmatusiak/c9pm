#!/bin/bash -e

PIXMAN="http://www.cairographics.org/releases/pixman-0.20.2.tar.gz"
CAIRO="http://cairographics.org/releases/cairo-1.10.2.tar.gz"
LIBPNG="ftp://ftp.simplesystems.org/pub/libpng/png/src/libpng-1.2.40.tar.gz"
PREFIX=$HOME

require() {
  echo "... checking for $1"
  if test `which $1`; then
    echo "... found"
  else
    echo "... not found"
    exit 1
  fi
}

fetch() {
  local tarball=`basename $1`
  echo "... downloading $tarball"
  local dir=${tarball/.tar.gz/}
  curl -# -L $1 -o $tarball \
    && echo "... unpacking" \
    && tar -zxf $tarball \
    && echo "... removing tarball" \
    && rm -fr $tarball \
    && install $dir
}

install() {
  local dir=$1
  echo "... installing $1"
 cd $dir \
   && ./configure --disable-dependency-tracking --prefix=$PREFIX \
   && make \
   && make install \
   && echo "... removing $dir" \
   && cd .. && rm -fr $dir
}

echo "... installing to $PREFIX"
require curl
require tar
fetch $PIXMAN
fetch $CAIRO