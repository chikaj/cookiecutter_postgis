#!/bin/bash
set -e

echo "Creating user {{cookiecutter.postgres_primary_user}} AND database {{cookiecutter.postgres_primary_db}} for user {{cookiecutter.postgres_primary_user}}"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER {{cookiecutter.postgres_primary_user}} WITH SUPERUSER PASSWORD '{{cookiecutter.postgres_primary_password}}';
    CREATE DATABASE {{cookiecutter.postgres_primary_db}} OWNER {{cookiecutter.postgres_primary_user}};
    GRANT ALL PRIVILEGES ON DATABASE {{cookiecutter.postgres_primary_db}} TO {{cookiecutter.postgres_primary_user}};
EOSQL

echo "Creating PostgREST authenticator and anonymous users and API Schema"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE {{cookiecutter.postgrest_anonymous_role}} NOLOGIN;
    CREATE ROLE {{cookiecutter.postgrest_authenticator_role}} NOINHERIT LOGIN PASSWORD '{{cookiecutter.postgrest_authenticator_password}}';
    GRANT {{cookiecutter.postgrest_anonymous_role}} to {{cookiecutter.postgrest_authenticator_role}};
    CREATE SCHEMA api;
    GRANT USAGE ON SCHEMA api TO {{cookiecutter.postgrest_anonymous_role}};
EOSQL