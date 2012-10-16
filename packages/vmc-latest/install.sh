#!/bin/bash

DEST=~/lib/pkg/vmc-latest

mkdir -p $DEST
cd $DEST

# grab the .zip file from amazon
wget --no-check-certificate https://s3-us-west-1.amazonaws.com/c9-deployment-templates/vmc.zip

# then unzip it
unzip vmc.zip -d .

# remove zip file
rm vmc.zip

# bundle the app
bundle

# target cloudfoundry
bin/vmc target api.cloudfoundry.com

# add to PATH cause symlinking no work...
echo export PATH=\$PATH:\$HOME/bin/deploy/vmc/bin >> $HOME/etc/.bashrc