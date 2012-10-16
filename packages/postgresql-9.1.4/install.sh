#!/bin/bash

DEST=~/lib/pkg/postgresql-9.1.4

mkdir -p $DEST
cd $DEST

# grab it dude
wget --no-check-certificate https://s3-us-west-1.amazonaws.com/c9-deployment-templates/postgres.zip
unzip postgres.zip -d .
rm postgres.zip

# initialize the database
bin/initdb -D ~/postgres-data

# add to path because we've got a ton of apps in the bin folder
echo export PATH=\$PATH:$DEST/bin >> $HOME/etc/.bashrc

# now give instructions to the user how to start it
echo -e =================
echo -e Postgresql has been installed\\n
echo -e Start it using:
echo -e \\tpostgres -h \$IP -D \~/postgres-data
echo -e or
echo -e \\tpg_ctl -h \$IP -D \~/postgres-data -l logfile start