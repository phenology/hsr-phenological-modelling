# Modis

In this project we use [MCD12Q2](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mcd12q2) version5 product.

## Download
[NASA search EarthData](https://search.earthdata.nasa.gov/) was used to download all the granulares for USA. The user needs to do a search on **MODIS Land cover dynamics** and then draw a [bounding box around USA excluding Alaska](https://search.earthdata.nasa.gov/search/granules?p=C190733713-LPDAAC_ECS&m=20.671875!-114.890625!2!1!2!0%2C2%2C1&tl=1421366400!5!!&q=MODIS+Land+Cover+Dynamics&ok=MODIS+Land+Cover+Dynamics&sb=-127.265625%2C23.90625%2C-63.140625%2C49.359375).

* Then press Download data. Note that to download it is necessary to [create an account](https://urs.earthdata.nasa.gov//users/new).

* Select the mode of download. We have used **Direct Download** and then requested the list of links. With [wget](https://www.gnu.org/software/wget/manual/wget.html) or using [addOn DownloadAll for Firefox](https://addons.mozilla.org/en-US/firefox/addon/downthemall/) the user can download all files which are in **HDF** format.

* For projections or to mosaic the granules it is necessary to download the *.xml* files as well. To download them install [**wget**](), use the [list of files]() with *.xml* as extension and run:
```
get.sh files.xml
```

## Convert to GeoTiffs

USA without Alaska touches in 17 granulares and version 5 of MCD12Q2 product only data for 14 years. Using [modis_mosaic from **pyModis**](http://www.pymodis.org/scripts/modis_mosaic.html) we will create 14 mosaics with each of them composed by 17 granulares. The each mosaic is saved as a GeoTiff, i.e., each year is represented as a GeoTiff.  

### Install pymodis
The following commands will install pymodis on your Ubuntu environment.

```
sudo apt-get install libgdal-dev
export CPLUS_INCLUDE_PATH=/usr/include/gdal
export C_INCLUDE_PATH=/usr/include/gdal
pip install GDAL==$(gdal-config --version | awk -F'[.]' '{print $1"."$2}')
sudo pip install pymodis
```

### Build GeoTiff mosaic out of HDF files
To create a mosaic we use [**modis_mosaic.py**](http://www.pymodis.org/scripts/modis_mosaic.html). As input argument it needs a file with the paths of the HDF files from which a mosaic will be created. To create such files run the following:
```
create_files_list.sh <path_to_hdf_files_directory>
```

The command above will create 14 files with the following nomenclature *<year>.files*.

The other arguments are **-s** where we specify which band we want to extract, **-o** string to be appended to the ouptup files, and **-v** to create a GDAL VRT file. For year 2004 the a mosaic for each band is created like this:
```
#Create a VRT file for each of the 8 bands
modis_mosaic.py -s "1 1 1 1 1 1 1 1" -o "" -v 2004.files

#Take a band, Onset_Greeness_Increase, and create a single band GEOtiff. 
modis_convert.py -v -s "( 1 )" -o A2004\001__Onset_Greenness_Increase -e 4326 A2004\001__Onset_Greenness_Increase.vrt
```

The argument **-e 4326** is to re-project the grid from **sinusoidal** to **EPSG 4326**. To do the same for all years and bands simlpy do:
```
mosaic_convert_modis.sh
```

### USA mask for modis data


## Upload GeoTiffs to HDFS

To upload the GeoTiffs to HDFS please follow the [data loading instructions for Phenology's infra-structure](https://github.com/phenology/infrastructure/tree/applications/applications).
