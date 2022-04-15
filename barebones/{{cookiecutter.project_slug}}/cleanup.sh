docker rm {{cookiecutter.project_slug}}_postgis
docker rm {{cookiecutter.project_slug}}_pgadmin4
docker rmi {{cookiecutter.project_slug}}_postgis
docker rmi {{cookiecutter.project_slug}}_pgadmin4
docker network rm {{cookiecutter.project_slug}}_barebones_network
docker volume rm {{cookiecutter.project_slug}}_postgis_data
docker volume rm {{cookiecutter.project_slug}}_pgadmin4_data