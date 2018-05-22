#!/bin/sh
#
#SBATCH --account=ocp            # The account name for the job.
#SBATCH -p short
#SBATCH --job-name=mitgcm-bling  # The job name.
#SBATCH -c 1                     # The number of cpu cores to use.
#SBATCH --time=1:59:00           # The time the job will take to run
#SBATCH --mem-per-cpu=1gb        # The memory the job will use per cpu core.

module load intel-parallel-studio/2017
module load netcdf-fortran/4.4.4
module load netcdf/gcc/64/4.4.0

tmpdir_NADR=/Users/raphael/SCRATCH/RUNS_MITGCM/tmpdir_1dmodel-NADR_BLING

# we want the new model
cp ./build/mitgcmuv $tmpdir_NADR/.

# we want input files
cp ./input_NADR/* $tmpdir_NADR/.
cp ./input_NADR/binaries/*.bin $tmpdir_NADR/.

date
cd $tmpdir_NADR ; ./mitgcmuv > log.run
date

