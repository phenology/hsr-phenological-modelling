#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, it should be: ./convert.sh <path_to_input_dir> <path_to_output_dir>"
    exit
fi

for f in `seq 2001 2014`; do 
  ls $1/*A$f*.hdf >> $f.files
done

#for f in `seq 2001 2014`; do 
#  for b in "_Onset_Greenness_Increase" "_Onset_Greenness_Maximum" "_Onset_Greenness_Decrease" "_Onset_Greenness_Minimum" "_NBAR_EVI_Onset_Greenness_Minimum" "_NBAR_EVI_Onset_Greenness_Maximum" "_NBAR_EVI_Area" "_Dynamics_QC"; do
#    echo "$f $b" ;
#    ls $1/*A$f*$b*.hdf >> $f$b.files
#  done
#done

#for f in `ls *.files | sed -e 's/\.files//'`; do 
#  echo $f ;
#  time modis_mosaic.py -f GTiff -o $2/$f.tif $f.files
#  rm -fr $f.files
#done
