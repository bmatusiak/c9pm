# Required env variables:
# NAME: name of package
# URL: URL of tar.gz

wget $URL
if [ "$TARBALL" == "" ]; then
    TARBALL=`basename $URL`
fi
DIR=$(sed -e's/\.tar\.gz//; s/\.tgz//;' <<< $TARBALL)

echo Extracting...
tar xfz $TARBALL
rm $TARBALL
cd $DIR

echo Building...
mkdir -p $HOME/lib/pkg
./configure --prefix=$HOME/lib/pkg/$NAME
make
make install

cd ..
rm -rf $DIR

echo Installing...
ln -s $HOME/lib/pkg/$NAME/bin/* $HOME/bin
