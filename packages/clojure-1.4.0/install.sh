#!/bin/bash

NAME=clojure
VERSION=1.4.0
URL=http://repo1.maven.org/maven2/org/clojure/clojure/$VERSION/clojure-$VERSION.zip

wget $URL
unzip $NAME-$VERSION.zip
rm $NAME-$VERSION.zip

mkdir -p $HOME/lib/pkg
mv $NAME-$VERSION $HOME/lib/pkg/$NAME-$VERSION
cp clj ~/bin