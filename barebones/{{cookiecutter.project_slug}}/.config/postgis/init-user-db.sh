#!/bin/bash
set -e

echo "Creating user {{cookiecutter.postgres_primary_user}} AND database {{cookiecutter.postgres_primary_db}} for user {{cookiecutter.postgres_primary_user}}"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER {{cookiecutter.postgres_primary_user}} WITH SUPERUSER PASSWORD '{{cookiecutter.postgres_primary_password}}';
    CREATE DATABASE {{cookiecutter.postgres_primary_db}} OWNER {{cookiecutter.postgres_primary_user}};
    GRANT ALL PRIVILEGES ON DATABASE {{cookiecutter.postgres_primary_db}} TO {{cookiecutter.postgres_primary_user}};
EOSQL