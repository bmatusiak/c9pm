c9pm
====

A simple package manager for [Cloud9 IDE](http://c9.io) projects.

Installation
------------

To install, open your terminal and copy the following command:

    wget -O ~/bin/c9pm https://raw.github.com/c9/c9pm/master/bin/c9pm && chmod +x ~/bin/c9pm
    
Usage
-----

Listing all available packages:

    c9pm list

Installing a package:

    c9pm install package1 package2

For instance, to install Python 3.3:

    c9pm install python33

All packages are installed in `~/lib/pkg`