FROM postgis/postgis:15-3.3 AS build

LABEL maintainer="{{cookiecutter.author}}"

RUN set -ex \
 && apt-get update \
 && apt-cache showpkg git \
 && apt-get install -y --no-install-recommends \
        git \
 && apt-cache showpkg make \
 && apt-get install -y --no-install-recommends \
        make \
 && apt-cache showpkg postgresql-server-dev-15 \
 && apt-get install -y --no-install-recommends \
        postgresql-server-dev-15 \
 && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/michelp/pgjwt.git

WORKDIR /pgjwt
RUN make install

FROM postgis/postgis:15-3.3

LABEL maintainer="{{cookiecutter.author}}"

COPY --from=build /usr/share/postgresql/15/extension/pgjwt* /usr/share/postgresql/15/extension/

RUN set -ex \
 && apt-get update \
 && apt-cache showpkg python3 \
 && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
 && apt-cache showpkg postgresql-plpython3-15 \
 && apt-get install -y --no-install-recommends \
        postgresql-plpython3-15 \
 && apt-cache showpkg postgresql-15-pgrouting \
 && apt-get install -y --no-install-recommends \
        postgresql-15-pgrouting \
        postgresql-15-pgrouting-scripts \
 && apt-cache showpkg pgloader \
 && apt-get install -y --no-install-recommends \
        pgloader \
 && apt-cache showpkg gdal-bin \
 && apt-get install -y --no-install-recommends \
        gdal-bin \
 && rm -rf /var/lib/apt/lists/*
RUN echo '#!/bin/bash\n/usr/bin/python3' > /usr/bin/python \
    && chmod +x /usr/bin/python \ 
    && echo '#!/bin/bash\n/usr/bin/pip3' > /usr/bin/pip \
    && chmod +x /usr/bin/pip
RUN rm /docker-entrypoint-initdb.d/10_postgis.sh
COPY init-user-db.sh /docker-entrypoint-initdb.d/10-init-user-db.sh
COPY initdb-postgis.sh /docker-entrypoint-initdb.d/11-initdb-postgis.sh