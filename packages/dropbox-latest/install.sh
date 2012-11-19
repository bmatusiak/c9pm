#!/bin/bash

# install daemon
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -

DEST=~/lib/pkg/dropbox-latest

mkdir -p $DEST
cd $DEST

# download script
wget https://www.dropbox.com/download?dl=packages/dropbox.py
chmod +x dropbox.py
ln -s $DEST/dropbox.py ~/bin/dropbox

echo -e
echo -e After authenticating, please terminate the process via \(CTRL+C,CMD+C\) and run:
echo -e \\tc9pm install dropbox_part2
echo -e Starting dropbox daemon...
echo -e

# show auth URL
~/.dropbox-dist/dropboxd