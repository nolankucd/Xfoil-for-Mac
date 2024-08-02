#!/bin/sh
xcode-select --install
brew install xquartz
brew install gfortran
cd orrs/bin
make -f Makefile_DP osgen
cd ../../plotlib
make libPlt_gSP.a
cd ../bin
sudo make xfoil
sudo make pplot
sudo make install
cd ..