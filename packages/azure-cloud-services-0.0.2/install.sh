#!/bin/bash

DEST=~/lib/pkg/acs-0.0.2

mkdir -p $DEST
cd $DEST

# grab the .zip file from amazon
wget --no-check-certificate https://s3-us-west-1.amazonaws.com/c9-deployment-templates/azure-cloud-services2.zip

# then unzip it
unzip azure-cloud-services2.zip -d .

# remove zip file
rm azure-cloud-services2.zip

# hmm they're not really executables a.t.m...
ln -s $DEST/apps.js $HOME/bin/acs-apps
ln -s $DEST/locations.js $HOME/bin/acs-locations
ln -s $DEST/publish.js $HOME/bin/acs-publish