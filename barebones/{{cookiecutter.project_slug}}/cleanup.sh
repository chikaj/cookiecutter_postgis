docker rm {{cookiecutter.project_slug}}_postgis
docker rmi {{cookiecutter.project_slug}}_postgis
docker network rm {{cookiecutter.project_slug}}_barebones_network
docker volume rm {{cookiecutter.project_slug}}_postgis_data