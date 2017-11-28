# Clustering
Clustering is a popular exploratory data analysis method that allows analysts to study their datasets at a higher level of abstraction.
Here we use [*k*-means](https://en.wikipedia.org/wiki/K-means_clustering) to identify regions with similar phenology (i.e. *phenoregions*).

* Multi-temporal *phenoregions*  
  Multi-temporal *phenoregions* can be identified by clustering time series of the phenological products.  Here we applied *k*-means to time series of the leaf and bloom indices (products of the extended spring indices), and to the SOS metric derived from AVHRR data. In the near future we will create phenoregions from other indices/metrics, and from the combination of both.

  *Phenoregions* were obtained by applying *k*-means to a matrix with as many rows as valid grid cells in [CONUS](https://en.wikipedia.org/wiki/Contiguous_United_States), and as many columns as years in the database. The SCALA/Python code was embedded in [Jupyter notebooks](https://github.com/phenology/infrastructure/tree/applications/applications/notebooks/stable) and run in a SPARK cluster.

  A brief overview of the existing notebooks is as follows:  

  Notebook | Brief description 
  --- | --- 
  [*k*-means_model](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/kmeans_model.ipynb) | For the extended spring indices: Loads Geo tiffs, creates data matrix, runs *k*-means, calculates WCSSE  
  [*k*-means_satellite](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/kmeans_satellite.ipynb) | same than above but for the AVHRR data
  [kmeans_wssse](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/kmeans_wssse.ipynb) | To read and plot WCSSE (or WSSSE) values 
  [create_wssse_csv](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/create_wssse_csv.ipynb) | To load an Array of triples stored as object File and save it again as a CSV file
  [plot_kmeans_clusters](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/plot_kmeans_clusters.ipynb)| To plot the Geo Tiffs created out of kmeans. Such Geo Tiffs contain the cluster IDs
  [plot_kmeans_clusters-Light](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/plot_kmeans_clusters-Light.ipynb)|light version of previous notebook. 
  [satellite_model_corr_len_neg](https://github.com/phenology/infrastructure/blob/master/applications/notebooks/stable/satellite_model_corr_len_neg.ipynb) | To calculate the correlation between spring indices and AVHRR SOS (loaded from Geo tiffs)

* Yearly *phenoregions*  
Yearly *phenoregions* can be identified by clustering phenological products in a different way. Now the data is put into a matrix that has as many rows as the number of valid cells in CONUS * the number of years in the time series, and as many columns as the number of phenologcal products being used to define the regions. In our case we used the leaf and bloom indices (experiment 1), and the leaf, and bloom indices together with the SOS metric (experiment 2).

  
 * Optimal number of clusters  
For the two cases described above (i.e. multi-temporal and yearly *phenoregions*), we used the ”elbow” of the [Within Cluster Sum of Squared Error (WCSSE) graph](https://en.wikipedia.org/wiki/Determining_the_number_of_clusters_in_a_data_set) to identify the optimal number of clusters (i.e. the optimal *k* value).
  
# Correlation
The ecological meaning of land surface phenological metrics is not fully clear yet. To shed light on this, we performed a spatio-temporal correlation analysis between the Leaf and Bloom indices and the SOS metric. The first step in the correlation analysis was to deal with the negative values in the AVHRR SOS metric.

From the meta data of the AVHRR phenology products: 
> The SOST units indicate the day of the year when positive; negative values indicate a SOST day in the previous year (for example, a SOST value of -10 for 2002 indicates a start of season day of 355 in 2001). Valid values range from -150 to 365. In the SOST data layer, a cell value of 1000 represents water bodies and a cell value of -1000 represents the area where a SOST could not be detected due to insufficient change in time-series NDVI or due to lack of sufficient input data

Thus, we first transformed the negative numbers [-150,0) to positive numbers representing the day of year (of year -1). Then we calculated the per pixel Pearson correlation between each of the spring indices and the AVHRR SOS value.
Interestingly, we saw areas with moderate to high negative correlation. These areas correspond to locations where phenology seems to be driven by other environmental factors (e.g. water), and to areas where the SOS happens in the second half of the year (i.e. cells with negative values in the original AVHRR SOS product).

# Output
- Extended abstract submitted to [ESA's big data from space 2017 conference](http://www.bigdatafromspace2017.org/)
- A manuscript for the [Springer's Journal of big data](https://journalofbigdata.springeropen.com/) is in the making 
