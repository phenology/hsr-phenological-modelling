# Clustering
Clustering is a popular exploratory data analysis method that allows analysts to study their datasets at a higher level of abstraction.
Here we use [*k*-means](https://en.wikipedia.org/wiki/K-means_clustering) to identify regions with similar phenology (i.e. *phenoregions*) from the extended spring indices, and from the AVHRR SOST phenological metric.

The optimal *k* value was identified by the ”elbow” of the [Within Cluster Sum of Squared Error (WCSSE) graph](https://en.wikipedia.org/wiki/Determining_the_number_of_clusters_in_a_data_set).

Multi-temporal *phenoregions* were obtained by applying *k*-means to a matrix with as many rows as valid gridcells in CONUS, and as many columns as years in the database. The SCALA/Python code was embedded in [Jupyter notebooks](https://github.com/phenology/infrastructure/tree/applications/applications/notebooks/stable)

A brief overview of the existing notebooks is as follows:  

Notebook | Brief description 
--- | --- 
[*k*-means_model](https://github.com/phenology/infrastructure/blob/applications/applications/notebooks/stable/kmeans_model.ipynb) | for the extended spring indices: Loads geotiffs, creates data matrix, runs *k*-means, calculates WCSSE  
[*k*-means_satellite](https://github.com/phenology/infrastructure/blob/applications/applications/notebooks/stable/kmeans_satellite.ipynb) | same than above but for the AVHRR data


# Correlation
Explain the negative values in the AVHRR dataset.  
explain the meaning of positive and negative correlations

# Output
- Extended abstract submitted to [ESA's big data from space 2017 conference](http://www.bigdatafromspace2017.org/)
- A manuscript for the [Springer's Journal of big data](https://journalofbigdata.springeropen.com/) is in the making 
