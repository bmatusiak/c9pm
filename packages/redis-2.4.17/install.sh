#!/bin/bash -e

NAME=redis-2.4.17
URL=http://redis.googlecode.com/files/$NAME.tar.gz
DEST=~/lib/pkg/$NAME

wget $URL

tar xfz $NAME.tar.gz
rm $NAME.tar.gz
cd $NAME
make

mkdir -p $DEST/bin
cp src/{redis-server,redis-cli} $DEST/bin/

cd ..
rm -rf $NAME

echo Installing...

ln -s $DEST/bin/* $HOME/bin | echo

cp default.conf ~/default-redis.conf

echo "In this environment, redis cannot bind to its default port, but it can bind to 15379"
echo "To start redis-server binding to that port, run: redis-server ~/default-redis.conf"
echo "To connect: redis-cli -p 15379"