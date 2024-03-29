# Cookiecutters for setting up PostgreSQL/PostGIS Docker files

This repository contains [cookiecutters](https://github.com/cookiecutter/cookiecutter) for creating 
PostgreSQL/PostGIS Dockerfiles and a docker-compose.yml file. The parameters of the created files
come from user input. Each of the directories in the repository create unique setups. The following 
directories are available.

## Barebones
[full_course](https://github.com/chikaj/cookiecutter_postgis/tree/main/barebones)
Contains:
* PostGIS (with gdal and pgloader installed)
* pgAdmin4 

## Webmap
[full_course](https://github.com/chikaj/cookiecutter_postgis/tree/main/webmap)
Contains:
* everything from Barebones
* pg_tileserv
* pg_featureserv

## PostgREST
[full_course](https://github.com/chikaj/cookiecutter_postgis/tree/main/postgrest)
Contains:
* (soon to be everything from Webmap)
* postgREST
* Swagger-UI


The cookiecutter command to create one of these setups is:

`cookiecutter http://github.com/chikaj/cookiecutter_postgis --directory="replace_with__directory_name"`

i.e., `cookiecutter https://github.com/chikaj/cookiecutter_postgis --directory="barebones"`

or if you want to use a branch of the repository (mostly for testing purposes):

`cookiecutter https://github.com/chikaj/cookiecutter_postgis --checkout branch_name --directory="replace_with__directory_name"`

i.e., `cookiecutter https://github.com/chikaj/cookiecutter_postgis --checkout dev --directory="postgrest"`
