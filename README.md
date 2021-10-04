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

It is best to run Xfoil from the runs folder (for example) so you can store your data without polluting the bin folder.

cd Xfoil-for-Mac-main/runs

the xfoil executable is up a directory in bin. You can run it with:

$ ../bin/xfoil

or if this doesn't work (maybe because you're using bash)

$ ../bin/./xfoil

The Xfoil enviorment should now be running. Enter ? for help.

To run a NACA 0012 airfoil enter

naca 0012

Then to perform operating point calculations enter:

oper

You can use invisid or viscous solutons. .OPERi indicated invisid and .OPERv viscous mode.
When using viscous mode you need to provide the Reynolds number. You can switch between modes by entering v or i.

The command

alfa N

Will calculate and plot CP vs X plot for the input airfoil at angle of attack N.
Use bl to plot boundary layer profiles.

The command

hard

will save the grpahics display to a postscript file stored in the runs directory.

If you want to ru through several angle of attacks we need to accumulate data. To do this use the pacc command.
Specify a filename such as NACA0012.txt. A dump file is optional. Now any calculations you run are stored to runs/NACA0012.txt.
We can use aseq to run through a series of angles of attack. You will be asked for the min, max and increment angle.
The CPx plot will update. The data will be written to the NACA0012.txt file and it can be plotted using
pplot

Care must be taken to ensure what you obtain from Xfoil is meaningful. You may need in increase the number of interations etc.

Sample output:


       XFOIL         Version 6.99
  
 Calculated polar for: NACA 0012                                       
  
 1 1 Reynolds number fixed          Mach number fixed         
  
 xtrf =   1.000 (top)        1.000 (bottom)  
 Mach =   0.000     Re =     0.200 e 6     Ncrit =   9.000  9.000
  
   alpha    CL        CD       CDp       CM     Top_Xtr  Bot_Xtr  Top_Itr  Bot_Itr
  ------ -------- --------- --------- -------- -------- -------- -------- --------
  -2.000  -0.3091   0.01065   0.00352   0.0123   0.9839   0.7012   2.6874 140.7978
  -1.000  -0.1415   0.01033   0.00382   0.0025   0.9531   0.8249   4.9760 148.1995
   0.000  -0.0000   0.01018   0.00387   0.0000   0.9053   0.9053   7.9637 153.0363
   1.000   0.1415   0.01033   0.00382  -0.0025   0.8249   0.9531  12.8004 156.0245
   2.000   0.3091   0.01065   0.00352  -0.0123   0.7013   0.9839  20.2000 158.3153
   3.000   0.4456   0.01104   0.00302  -0.0179   0.5549   1.0000  28.9714 160.0000
   4.000   0.5353   0.01176   0.00283  -0.0144   0.4165   1.0000  37.3295 160.0000
   5.000   0.6190   0.01307   0.00305  -0.0098   0.2749   1.0000  46.0388 160.0000
   6.000   0.6973   0.01512   0.00388  -0.0043   0.1561   1.0000  53.6782 160.0000
   7.000   0.7730   0.01770   0.00534   0.0018   0.1005   1.0000  57.6338 160.0000
   8.000   0.8494   0.02075   0.00725   0.0076   0.0751   1.0000  59.7618 160.0000
   9.000   0.9291   0.02484   0.00998   0.0123   0.0606   1.0000  61.2060 160.0000
  10.000   1.0070   0.02977   0.01371   0.0167   0.0512   1.0000  62.2954 160.0000
  11.000   1.0716   0.03626   0.01873   0.0216   0.0450   1.0000  63.1141 160.0000
  12.000   1.0952   0.04453   0.02622   0.0296   0.0412   1.0000  63.6819 160.0000
  13.000   1.0819   0.05547   0.03468   0.0367   0.0391   1.0000  64.0021 160.0000
  14.000   0.9861   0.07624   0.05472   0.0299   0.0394   1.0000  63.9528 160.0000
  17.000   0.5233   0.18008   0.15846  -0.0176   0.0565   1.0000  61.6671 160.0000
  19.000   0.5500   0.19981   0.18715  -0.0253   0.0464   1.0000  62.9180 160.0000
  20.000   0.5533   0.21064   0.20602  -0.0314   0.0416   1.0000  63.6268 160.0000
  21.000   0.5762   0.22175   0.21959  -0.0341   0.0390   1.0000  64.0225 160.0000
  22.000   0.5807   0.23131   0.23958  -0.0407   0.0342   1.0000  64.8379 160.0000
