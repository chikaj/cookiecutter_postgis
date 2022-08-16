## Import Shapefile: soon to be available with GDAL 3.4
```
ogr2ogr -f "PostgreSQL" postgresql://duck:quack@localhost:5432/geo capcog_city_limits.shp -nln public.capcog -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom
```

## Import Shapefile: available prior to GDAL 3.4
```
ogr2ogr -f "PostgreSQL" "PG:user=duck password=quack host=localhost port=5432 dbname=geo" capcog_city_limits.shp -nln public.capcog3 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom
```

## Shapefile export
```
ogr2ogr -f "ESRI Shapefile" polygons.shp "PG:user=duck password=quack host=localhost port=5432 dbname=geo" public.capcog
```

## GeoJSON export
```
ogr2ogr -f "GeoJSON" polygons.geojson "PG:user=duck password=quack host=localhost port=5432 dbname=geo" public.capcog
```