# Xfoil-for-Mac
This is a fork of the venerable Xfoil with tweaks to allow installation on MacOS 11.

Quick Method to install xfoil
=============================
If you like, you can simply intall xfoil by typing this command line in your terminal session.
> [!NOTE]
> In the command line below you must replace `[parents directory]` with the path to the directory where the `Xfoil-for-Mac-main` folder is located. For example if it is located in your Downloads folder, the line will become `cd ~/Downloads/Xfoil-for-Mac-main`
```
cd [parents directory]/Xfoil-for-Mac-main
sh install-xfoil.sh
```



Prerequisites
=============

Install Xcode from the Mac App Store

Install Command Line Tools:
```
xcode-select --install
```
Install Homebrew (https://brew.sh)

Use homebrew to install XQuartz (requires a log out/in) to allow Xfoil to display graphics.
```
brew install xquartz
```
Install gfortran which will be used to compile Xfoil
```
brew install gfortran
```
Installation
============

Download the contents of the repository and unpack to a location where you want to run Xfoil from. The following commands will walk you through the compilation process. All lines begining with a $ are commands you enter into the commandline. You don't include the $. If you are new to using a terminal I recommend this primer:
http://lab46.corning-cc.edu/_media/haas/ufbm.pdf
All make files have been updated to use relative paths so you shouldn't need to edit any of the files. For example line 101 in orrs/src/osmap.f must point to the location of osmapDP.dat.
Modify line 10 of file bin/Makefile with this code 
```
BINDIR = /usr/local/bin/
```

```
cd Xfoil-for-Mac-main
cd  orrs/bin
make -f Makefile_DP osgen
```

If you get an error:
clang: error: invalid version number in '-mmacosx-version-min=11.5'
You need to reinstall the Xcode Command Line Tools, see guide at the end of this file.

```
cd ../../plotlib
make libPlt_gSP.a
cd ../bin
sudo make xfoil
sudo make pplot
sudo make pxplot
sudo make install
```
Running Xfoil
=============

With the last previous command you installed `xfoil`, `pplot` and `pxplot` on `/usr/local/bin` folder than you can simply digit on your terminal window

```xfoil```

The Xfoil enviorment should now be running. Enter ? for help.

To run a NACA 0012 airfoil enter

```naca 0012```

Then to perform operating point calculations enter:

```oper```

You can run either inviscid or viscous solutons. 
`.OPERi` indicates inviscid and `.OPERv` viscous mode.
When using viscous mode you need to provide the Reynolds number. You can switch between modes by entering `v` or `i`.

The command

```alfa N```

Will calculate and plot CP vs X plot for the input airfoil at angle of attack N.
Use the comand bl to plot boundary layer profiles.

The command

```hard```

will save the graphics display to a postscript file stored in the runs directory.

If you want to run through several angle of attacks we need to accumulate data. To do this use the 

```pacc```

command.

Specify a filename such as `NACA0012.txt`. A dump file is optional. Now any calculations you run are stored to r`uns/NACA0012.txt`.

We can use

```aseq```

to run through a series of angles of attack. You will be asked for the min, max and increment angle.
The CPx plot will update. The data will be written to the `NACA0012.txt` file and it can be plotted using

```pplot```

Care must be taken to ensure what you obtain from Xfoil is meaningful. You may need in increase the number of interations etc.

Reinstall Command Line Tools
============================

If you get an error:
```clang: error: invalid version number in '-mmacosx-version-min=11.5'```
Then you can reinstall the Command line Tools to fix the issue.

```sudo rm -rf /Library/Developer/CommandLineTools```

Note the sudo command will require your system password, no characters will appear as you type as a security measure. 

Install Command Line Tools:
```xcode-select --install```
This will prompt you to run the installer and agree to license terms. This step can take a few minutes.
