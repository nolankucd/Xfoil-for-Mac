# Xfoil-for-Mac
This is a fork of the venerable Xfoil with tweaks to allow installation on MacOS 11.

Prerequisites
=============

Install Xcode from the Mac App Store

Install Command Line Tools:
$ xcode-select --install

Install Homebrew (https://brew.sh)

Use homebrew to install XQuartz (requires a log out/in) to allow Xfoil to display graphics.
$ brew install xquartz

Install gfortran which will be used to compile Xfoil
$ brew gfortran

Installation
============

Download the contents of the repository and unpack to a location where you want to run Xfoil from. The following commands will walk you through the compilation process. All lines begining with a $ are commands you enter into the commandline. You don't include the $. If you are new to using a terminal I recommend this primer:
http://lab46.corning-cc.edu/_media/haas/ufbm.pdf
All make files have been updated to use relative paths so you shouldn't need to edit any of the files. For example line 101 in orrs/src/osmap.f must point to the location of osmapDP.dat.

$ cd Xfoil-for-Mac-main

$ cd  orrs/bin
$ make -f Makefile_DP osgen

If you get an error:
clang: error: invalid version number in '-mmacosx-version-min=11.5'
You need to reinstall the Xcode Command Line Tools, see guide below.

$ cd ../../plotlib

make libPlt_gSP.a

$ cd ../bin

$ make xfoil
$ make pplot
$ make pxplot


Reinstall Command Line Tools
============================

$ sudo rm -rf /Library/Developer/CommandLineTools

Note the sudo command will require your system password, no characters will appear as you type as a security measure. 

Install Command Line Tools:
$ xcode-select --install
This will prompt you to run the installer and agree to license terms. This step can take a few minutes.

Running Xfoil
=============
