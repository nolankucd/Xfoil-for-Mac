# Xfoil-for-Mac
This is a fork of the venerable Xfoil with tweaks to allow installation on MacOS 11.

Installation
============

Install Xcode from the Mac App Store

Install Command Line Tools:
$ xcode-select --install

Install Homebrew (https://brew.sh)

Use homebrew to install XQuartz (requires a log out/in) to allow Xfoil to display graphics.
$ brew install xquartz

Install gfortran which will be used to compile Xfoil
$ brew fortran

All make files have been updated to use relative paths so you shouldn't need to edit any of the files.

Download the contents of the repository and unpack.

$ cd xfoil
