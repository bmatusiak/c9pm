#!/bin/bash

DEST=~/lib/pkg/vmc-0.0.1

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
echo export PATH=\$PATH:$DEST/bin >> $HOME/etc/.bashrc

# remove the gem version because it interferes in the path
rm ~/lib/ruby/gems/bin/vmc

# execute it in the current shell as well so it works immediately
export PATH=$PATH:$DEST/bin

echo -e
echo -e VMC has been installed
echo -e
echo -e View available commands via:
echo -e \\tvmc help
echo -e
echo -e NOTE! When building web applications listen to these environment variables:
echo -e \\tPort:\\tPORT
echo -e \\tHost:\\tIP