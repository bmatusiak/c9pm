c9pm
====

A simple package manager for [Cloud9 IDE](http://c9.io) workspaces.

Installation
------------

c9pm is now installed in all regular workspaces automatically.
    
Usage
-----

Listing all available packages:

    c9pm list

Installing a package:

    c9pm install package1 package2

For instance, to install Python 3.3:

    c9pm install python33

All packages are installed in `~/lib/pkg`, binaries are symlinked in `~/bin`
which is in the user's path.

Contributing
------------

Fork this repo, add a new package, create a pull request!

Naming convention for packages: `<name>-<version>`:

* `install.sh`: bash script to download the tarball or clone the git repo, compile
  and install. Does whatever it takes to setup the package in the user's environment.
* `package.json`: a description of the package:
  * `name`: Package name
  * `version`: Package version
  * `dependencies`: Currently ignored
  * `downloadable`: Whether instead of compiling from source (according to
     `install.sh`, this package can be downloaded as a tar.gz from the c9
     package server instead).