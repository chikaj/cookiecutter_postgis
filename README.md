# Cookiecutters for setting up PostgreSQL/PostGIS Docker files

This repository contains [cookiecutters](https://github.com/cookiecutter/cookiecutter) for creating 
PostgreSQL/PostGIS Dockerfiles and a docker-compose.yml file. The parameters of the created files
come from user input. Each of the directories in the repository create unique setups. The following 
directories are available.

## Barebones


## Mapping


## Full Course
[full_course](https://github.com/chikaj/cookiecutter_postgis/tree/main/full_course)
Contains:
* everything from Mapping, 
* gdal
* pgloader

## GraphQL


## Spatial GraphQL

## PostgREST

Run from a branch, in this case 'dev'
cookiecutter https://github.com/chikaj/cookiecutter_postgis --checkout dev --directory="postgrest"



The cookiecutter command to create one of these setups is:

`cookiecutter http://github.com/chikaj/cookiecutter_postgis --directory="replace_with__directory_name"`
