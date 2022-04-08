FROM postgis/postgis:14-3.2

LABEL maintainer="{{cookiecutter.author}}"

RUN set -ex \
 && apt-get update \
 && apt-cache showpkg python3 \
 && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
 && apt-cache showpkg postgresql-plpython3-14 \
 && apt-get install -y --no-install-recommends \
        postgresql-plpython3-14 \
 && apt-cache showpkg postgresql-14-pgrouting \
 && apt-get install -y --no-install-recommends \
        postgresql-14-pgrouting \
        postgresql-14-pgrouting-scripts \
 && rm -rf /var/lib/apt/lists/*
RUN echo '#!/bin/bash\n/usr/bin/python3' > /usr/bin/python \
    && chmod +x /usr/bin/python \ 
    && echo '#!/bin/bash\n/usr/bin/pip3' > /usr/bin/pip \
    && chmod +x /usr/bin/pip
RUN rm /docker-entrypoint-initdb.d/10_postgis.sh
COPY init-user-db.sh /docker-entrypoint-initdb.d/10-init-user-db.sh
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/11-initdb-postgis.sh