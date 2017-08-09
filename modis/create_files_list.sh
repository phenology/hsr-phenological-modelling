#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, it should be: ./convert.sh <path_to_input_dir> <path_to_output_dir>"
    exit
fi

for f in `seq 2001 2014`; do 
  ls $1/*A$f*.hdf >> $f.files
done
