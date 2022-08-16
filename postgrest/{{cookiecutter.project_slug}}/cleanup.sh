docker rm {{cookiecutter.project_slug}}_postgis
docker rm {{cookiecutter.project_slug}}_pgadmin4
docker rm {{cookiecutter.project_slug}}_postgrest
docker rm {{cookiecutter.project_slug}}_swagger
docker rmi {{cookiecutter.project_slug}}_postgis
docker rmi {{cookiecutter.project_slug}}_pgadmin4
docker rmi {{cookiecutter.project_slug}}_postgrest
docker rmi {{cookiecutter.project_slug}}_swagger
docker network rm {{cookiecutter.project_slug}}_postgrest_network
docker volume rm {{cookiecutter.project_slug}}_postgis_data
docker volume rm {{cookiecutter.project_slug}}_pgadmin4_data