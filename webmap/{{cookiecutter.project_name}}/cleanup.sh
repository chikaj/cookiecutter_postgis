docker rm {{cookiecutter.project_slug}}_postgis
docker rm {{cookiecutter.project_slug}}_pgadmin4
docker rm {{cookiecutter.project_slug}}_pg_tileserv
docker rm {{cookiecutter.project_slug}}_pg_featureserv
docker rmi {{cookiecutter.project_slug}}_postgis
docker rmi {{cookiecutter.project_slug}}_pgadmin4
docker rmi {{cookiecutter.project_slug}}_pg_tileserv
docker rmi {{cookiecutter.project_slug}}_pg_featureserv
docker network rm {{cookiecutter.project_slug}}_mapping_network
docker volume rm {{cookiecutter.project_slug}}_postgis_data
docker volume rm {{cookiecutter.project_slug}}_pgadmin4_data