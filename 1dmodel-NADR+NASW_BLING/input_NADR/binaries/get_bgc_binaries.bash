#!/bin/bash

region=NADR
lukesdir=/Users/raphael/WORK/1d_model/MITgcm-ballast-model-1D/

datafromdir=$lukesdir/running/1d_${region}_two_province/inputs

for file in ${region}_dic_glodap_prof.bin ${region}_alk_glodap_prof.bin ${region}_oxy_woa_prof.bin \
            ${region}_nitr_woa_prof.bin ${region}_phos_woa_prof.bin ${region}_sil_woa_prof.bin fet_uniform.bin \
            interp_OWSM_DON_run83_janprof.bin interp_OWSM_DOP_run83_janprof.bin ; do

   cp $datafromdir/$file .
   ./convert_bgc_variables2bling.py $file
   rm $file

done

cp $datafromdir/NADR_temp_woa_prof.bin .
cp $datafromdir/NADR_salt_woa_prof.bin .
cp $datafromdir/NADR_tauy_ncep_monsurf.bin .
cp $datafromdir/NADR_taux_ncep_monsurf.bin .
cp $datafromdir/NADR_temp_woa_monsurf.bin .
cp $datafromdir/nwp_bathyneg.bin .
