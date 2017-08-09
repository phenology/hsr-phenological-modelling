# AVHRR

In this project we use the phenological metrics derived from time series of the Advanced Very High Resolution Radiometer [(AVHRR)](https://lta.cr.usgs.gov/AVHRR).
These metrics were derived by the USGS and only avalable for CONUS. See this [link](https://lta.cr.usgs.gov/avhrr_phen) and this [link](https://phenology.cr.usgs.gov/index.php) for more info about this product. In a nutshell, the product is available for the period 1980 till 2015 at a spatial resolution of 1km. Thus far, we only used the Start of Season Time (SOST) metric, which indicates the beginning of measurable photosynthesis in the vegetation canopy (day of year).

## Download
[NASA Earth Explorer](https://earthexplorer.usgs.gov/) was used to download geotiffs for 1980 till 2013.  
NB: The geotiff for 2014 was downloaded from the following USGS [website](https://phenology.cr.usgs.gov/get_data_1km.php) 

In Earth Explorer (EE), the user needs to click the **Data Sets** tab. Then go to *Vegetation Monitoring*, tick the box *AVHRR phenology* and press *results*. This lists all the AVHRR phenological datasets, which have to be downloaded manually by clicking on the download icon next to each little map. We selected the geotiff format. NB: users need to create an account to be able to donwload this data

The files downloaded from the Earth Explorer contain single band geotiffs for each of the 9 available metrics 
The files downloaded from the USGS website only contain a single metric (SOST, in our case)

## Change projection and mask CONUS 
After unzipping the files donwloaded from EE to a single folder we run a batch file (ProcessPHA_SIx.bat; see below the contents of this file) to change their projection and to crop them. This pre-processing is needed because these files will be used together with the spring indices produced using [Google Earth Engine](https://earthengine.google.com/) 

```
for %%f in (*v4.tif) do (
	echo %%~nf
	gdalwarp -overwrite -t_srs EPSG:4326 -ts 7808 3892 -cutline D:/Documents/projects/eScience_phenology/EmmaIV/statesContuguos.shp -te -126.3031289472047263 14.2921961703415903 -56.1626715631524860 49.2546270282733687 -te_srs EPSG:4326  -srcnodata "1000 -1000" -dstnodata -1000 -of GTiff -co "COMPRESS=DEFLATE" %%~nf.tif %%~nf_SIx.tif
	REM goto :eof
) 
```

The coordinates of the bounding box needed to run gdalwarp were obtained using QGIS.  
The shapefilefile statesContuguos can be found [here](/.../...).  

## Upload GeoTiffs to HDFS
To upload the GeoTiffs to HDFS please follow the [data loading instructions for Phenology's infra-structure](https://github.com/phenology/infrastructure/tree/applications/applications).
