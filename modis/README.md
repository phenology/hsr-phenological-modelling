# Modis

In this project we use [MCD12Q2](https://lpdaac.usgs.gov/dataset_discovery/modis/modis_products_table/mcd12q2) version5 product.

## Download
[NASA search EarthData](https://search.earthdata.nasa.gov/) was used to download all the granulares for USA. The user needs to do a search on **MODIS Land cover dynamics** and then draw a [bounding box around USA excluding Alaska](https://search.earthdata.nasa.gov/search/granules?p=C190733713-LPDAAC_ECS&m=20.671875!-114.890625!2!1!2!0%2C2%2C1&tl=1421366400!5!!&q=MODIS+Land+Cover+Dynamics&ok=MODIS+Land+Cover+Dynamics&sb=-127.265625%2C23.90625%2C-63.140625%2C49.359375).

* Then press Download data. Note that to download it is necessary to [create an account](https://urs.earthdata.nasa.gov//users/new).

* Select the mode of download. We have used **Direct Download** and then requested the list of links. With [wget](https://www.gnu.org/software/wget/manual/wget.html) or using [addOn DownloadAll for Firefox](https://addons.mozilla.org/en-US/firefox/addon/downthemall/) the user can download all files which are in **HDF** format. 
O

## Convert to GeoTiffs

USA without Alaska touches in 17 granulares and version 5 of MCD12Q2 product only data for 14 years. Using [modis_mosaic from **pyModis**](http://www.pymodis.org/scripts/modis_mosaic.html) 14 mosics of 17 granulares of each were created and saved as a GeoTiff. Each year is thus represented as a GeoTiff.  

```
```

## Upload GeoTiffs to HDFS

To upload the GeoTiffs to HDFS please follow the [data loading instructions for Phenology's infra-structure](https://github.com/phenology/infrastructure/tree/applications/applications).
