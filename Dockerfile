FROM postgres:13.6-alpine3.15

RUN apk add postgresql13-dev=13.6-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/v3.15/main
RUN apk add --no-cache make git gcc libc-dev

RUN git clone https://github.com/morzik45/postgres-phash-hamming.git
# RUN mkdir -p /var/lib/postgresql-static/data
# ENV PGDATA /var/lib/postgresql-static/data

RUN make -C postgres-phash-hamming  && make install -C postgres-phash-hamming

COPY load-extensions.sh /docker-entrypoint-initdb.d/

RUN echo "extensions installed"
