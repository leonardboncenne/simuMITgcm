#!/bin/bash

# module MITgcm contains all necessary module load [libs]
# and set MITGCM_ROOTDIR
machine=laptop

if [ $machine == laptop ] ; then
   . /opt/esm-soft/Modules/3.2.10/init/bash
   module load MITgcm/trunk
elif [ $machine == habanero ] ; then
   module load MITgcm/intel
fi

# check version number and save it to file
version=$( cd $MITGCM_ROOTDIR ; git log | head -1 | awk '{ print $NF }' )
date >> version
echo 'model compiled with version' $version >> version

# create build directory
if [ -d build ]  ; then rm -Rf build ; fi
if [ ! -d build ] ; then mkdir build ; fi
cd build

# create Makefile
#genmake2 -mods ../code -mpi -of $optfile
genmake2 -mods ../code -of $optfile
#genmake2 -mods ../code -devel -of $optfile

# compile the model
make depend ; make -j 4
