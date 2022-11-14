FROM pramsey/pg_tileserv:20221019

COPY ./.config/wait-for-it.sh /app/wait-for-it.sh
USER root
RUN chmod +x wait-for-it.sh
USER 1001

ENTRYPOINT ["./wait-for-it.sh", "{{cookiecutter.project_name}}_postgis:5432", "--strict", "--timeout=60", "--", "./pg_tileserv"]
