#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load PostGIS into both template_database and $POSTGRES_DB
echo "Setting up database {{cookiecutter.postgres_primary_db}}"
for DB in "{{cookiecutter.postgres_primary_db}}"; do
	# echo "Creating Schemas and loading PostGIS extensions into $DB"
	echo "Creating Schemas in $DB"
	psql --dbname={{cookiecutter.postgres_primary_db}} --username={{cookiecutter.postgres_primary_user}} <<-'EOSQL'
		CREATE SCHEMA AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA postgis AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA topology AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA pgrouting AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA fuzzystrmatch AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA address_standardizer AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA address_standardizer_data_us AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA tiger AUTHORIZATION {{cookiecutter.postgres_primary_user}};
	EOSQL
	echo "Creating PostGIS extensions in $DB"
	psql --dbname={{cookiecutter.postgres_primary_db}} --username={{cookiecutter.postgres_primary_user}} <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_raster SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_sfcgal SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_topology SCHEMA topology;
		CREATE EXTENSION IF NOT EXISTS pgrouting SCHEMA pgrouting;
		CREATE EXTENSION IF NOT EXISTS fuzzystrmatch SCHEMA fuzzystrmatch;
		CREATE EXTENSION IF NOT EXISTS address_standardizer SCHEMA address_standardizer;
		CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us SCHEMA address_standardizer_data_us;
		CREATE EXTENSION IF NOT EXISTS plpython3u;
	EOSQL

	psql --dbname={{cookiecutter.postgres_primary_db}} <<-'EOSQL'
		ALTER DATABASE {{cookiecutter.postgres_primary_db}} SET search_path = {{cookiecutter.postgres_primary_user}}, public, postgis, topology, pgrouting, fuzzystrmatch, address_standardizer, address_standardizer_data_us;
	EOSQL
	psql --dbname={{cookiecutter.postgres_primary_db}} --username={{cookiecutter.postgres_primary_user}} <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder SCHEMA tiger;
		ALTER DATABASE {{cookiecutter.postgres_primary_db}} SET search_path = {{cookiecutter.postgres_primary_user}}, public, postgis, topology, pgrouting, fuzzystrmatch, address_standardizer, address_standardizer_data_us, postgis_tiger_geocoder;
	EOSQL
done
