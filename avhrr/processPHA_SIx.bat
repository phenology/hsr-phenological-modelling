for %%f in (*v4.tif) do (
	echo %%~nf
	gdalwarp -overwrite -t_srs EPSG:4326 -ts 7808 3892 -cutline D:/Documents/projects/eScience_phenology/EmmaIV/statesContuguos.shp -te -126.3031289472047263 14.2921961703415903 -56.1626715631524860 49.2546270282733687 -te_srs EPSG:4326  -srcnodata "1000 -1000" -dstnodata -1000 -of GTiff -co "COMPRESS=DEFLATE" %%~nf.tif %%~nf_SIx.tif
	REM goto :eof
) 

