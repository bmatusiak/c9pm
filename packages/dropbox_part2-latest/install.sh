dropbox start

sleep 10

# exclude stuff
dropbox exclude add ~/Dropbox/*
dropbox exclude add ~/Dropbox/*
dropbox exclude add ~/Dropbox/*
dropbox exclude add ~/Dropbox/*

# tah dah
mkdir ~/Dropbox/cloud9
ln -s $PWD ~/Dropbox/cloud9/$C9_PROJECT

dropbox exclude remove ~/Dropbox/cloud9/$C9_PROJECT

echo -e
echo -e Dropbox has been installed, and your current project is synced to a folder called cloud9/$C9_PROJECT
echo -e
echo -e View available commands via:
echo -e \\tdropbox
echo -e
echo -e Please note that your dropbox data will also be synced to your Cloud9 project, which is subject to storage limitations.
echo -e To exclude folders use:
echo -e \\tdropbox exclude \~/Dropbox/foldername