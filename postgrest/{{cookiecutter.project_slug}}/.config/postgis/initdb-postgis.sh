#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load PostGIS into both template_database and $POSTGRES_DB
echo "Setting up database {{cookiecutter.postgres_primary_db}}"
for DB in "{{cookiecutter.postgres_primary_db}}"; do
	# echo "Creating Schemas and loading PostGIS extensions into $DB"
	echo "Creating Schemas in {{cookiecutter.postgres_primary_db}}"
	psql --dbname={{cookiecutter.postgres_primary_db}} --username={{cookiecutter.postgres_primary_user}} <<-'EOSQL'
		-- CREATE SCHEMA AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		CREATE SCHEMA postgis AUTHORIZATION {{cookiecutter.postgres_primary_user}};
		-- CREATE SCHEMA topology AUTHORIZATION {{cookiecutter.postgres_primary_user}};
	EOSQL
	echo "Creating PostGIS extensions in {{cookiecutter.postgres_primary_db}}"
	psql --dbname={{cookiecutter.postgres_primary_db}} --username={{cookiecutter.postgres_primary_user}} <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS postgis SCHEMA postgis;
		CREATE EXTENSION IF NOT EXISTS postgis_raster SCHEMA postgis;
		-- CREATE EXTENSION IF NOT EXISTS postgis_topology SCHEMA topology;
		ALTER DATABASE {{cookiecutter.postgres_primary_db}} SET postgis.enable_outdb_rasters = true;
		ALTER DATABASE {{cookiecutter.postgres_primary_db}} SET postgis.gdal_enabled_drivers TO 'ENABLE_ALL';
		-- ALTER ROLE $PGUSER SET search_path=public,postgis;
		ALTER DATABASE {{cookiecutter.postgres_primary_db}} SET search_path = {{cookiecutter.postgres_primary_user}}, public, postgis, topology;
	EOSQL
done
