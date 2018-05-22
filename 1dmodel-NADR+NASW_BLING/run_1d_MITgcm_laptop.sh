#!/bin/bash

# need to init modules
. /opt/esm-soft/Modules/3.2.10/init/bash
# load my custom MITgcm module
module load MITgcm/trunk

tmpdir_NADR=/Users/raphael/SCRATCH/RUNS_MITGCM/tmpdir_1dmodel-NADR_BLING

# we want to copy the latest build of the model
cp ./build/mitgcmuv $tmpdir_NADR/.

# we want to copy the input files
cp ./input_NADR/* $tmpdir_NADR/.
cp ./input_NADR/binaries/*.bin $tmpdir_NADR/.

date
cd $tmpdir_NADR ; ./mitgcmuv > log.run
date

