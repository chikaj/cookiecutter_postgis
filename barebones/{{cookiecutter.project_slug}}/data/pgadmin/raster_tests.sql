SHOW postgis.gdal_enabled_drivers;
SHOW postgis.enable_outdb_rasters;

SELECT *
FROM raster_columns;

SELECT *
FROM concise_tif;

SELECT ST_BandPath(rast)
FROM concise_tif
LIMIT 1;

SELECT (ST_MetaData(rast)).* 
FROM concise_tif
LIMIT 1;

SELECT (ST_BandMetaData(rast)).* 
FROM concise_tif
LIMIT 1;

SELECT ST_NumBands(rast)
FROM concise_tif
LIMIT 1;

SELECT ST_GeoReference(rast)
FROM concise_tif
LIMIT 1;

SELECT ST_Summary(rast)
FROM concise_tif
LIMIT 1;

SELECT rid, band, (stats).*
FROM (SELECT rid, band, ST_SummaryStats(rast, band) As stats
      FROM concise_tif CROSS JOIN generate_series(1,4) As band
      WHERE rid=2) As foo;

SELECT band, max(stats)
FROM (SELECT rid, band, ST_Value(rast, band, 100, 100) AS stats
	  FROM concise_tif CROSS JOIN generate_series(1, 4) AS band) AS foo
GROUP BY band
ORDER BY band;

SELECT ST_AsTIFF(rast, 'LZW') As rasttiff
FROM concise_tif
WHERE rid = 1;
