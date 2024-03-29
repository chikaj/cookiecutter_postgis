## Create tiled raster using gdal_translate with GEOTIFF options
```
gdal_translate -co COMPRESS=DEFLATE -co ZLEVEL=9 -co PREDICTOR=2 -co TILED=YES concise.tif concise_tif.tif
```

## Create tiled raster using gdal_translate with COG options
```
gdal_translate -co TILING_SCHEME=GoogleMapsCompatible -co COMPRESS=DEFLATE -co LEVEL=9 concise.tif concise_cog.tif
```
## (Optional) Upload tiled raster to bucket storage

## Import raster: soon to be available with GDAL 3.4
```
raster2pgsql -t 256x256 -C -r -P -M -I -R -F /work/geospatial/raster/concise_tif.tif concise_tif | psql postgresql://duck:quack@localhost:5432/geo
```
* -R # register the table as 'out-db' raster
* See [here](https://postgis.net/docs/using_raster_dataman.html#RT_Raster_Loader) for description of all raster2pgsql flags
* (Optional) Replace '/work/geospatial/raster/concise.tif' with '/vsicurl/https://url.com/bucket-storage/concise.tif'

## GeoTIFF creation
```
SELECT ST_AsTIFF(rast, 'LZW') As rasttiff
FROM concise_tif;
```

## See:
* [PostGIS Raster post at Crunchy Data](https://www.crunchydata.com/blog/postgis-raster-and-crunchy-bridge)
* [raster2pgsql help](https://postgis.net/docs/using_raster_dataman.html#RT_Raster_Loader)