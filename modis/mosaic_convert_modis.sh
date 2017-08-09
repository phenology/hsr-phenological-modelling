#!/bin/bash

for f in `seq 2003 2014`; do
  echo $f
  modis_mosaic.py -s "1 1 1 1 1 1 1 1" -o "" -v $f.files
done

for f in `seq 2007 2014`; do
  echo $f
  modis_convert.py -v -s "( 1 )" -o A$f\001__Onset_Greenness_Increase -e 4326 A$f\001__Onset_Greenness_Increase.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__Onset_Greenness_Maximum -e 4326 A$f\001__Onset_Greenness_Maximum.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__Onset_Greenness_Decrease -e 4326 A$f\001__Onset_Greenness_Decrease.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__Onset_Greenness_Minimum -e 4326 A$f\001__Onset_Greenness_Minimum.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__NBAR_EVI_Onset_Greenness_Minimum -e 4326 A$f\001__NBAR_EVI_Onset_Greenness_Minimum.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__NBAR_EVI_Onset_Greenness_Maximum -e 4326 A$f\001__NBAR_EVI_Onset_Greenness_Maximum.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__NBAR_EVI_Area -e 4326 A$f\001__NBAR_EVI_Area.vrt
  modis_convert.py -v -s "( 1 )" -o A$f\001__Dynamics_QC -e 4326 A$f\001__Dynamics_QC.vrt
  #./gdal_merge.py -o data/$f.tif -separate A$f\001__Onset_Greenness_Increase.tif A$f\001__Onset_Greenness_Maximum.tif A$f\001__Onset_Greenness_Decrease.tif A$f\001__Onset_Greenness_Minimum.tif A$f\001__NBAR_EVI_Onset_Greenness_Minimum.tif A$f\001__NBAR_EVI_Onset_Greenness_Maximum.tif A$f\001__NBAR_EVI_Area.tif A$f\001__Dynamics_QC.tif
done


