FROM ghcr.io/kubernetize/alpine-service-base

LABEL maintainer="Richard Kojedzinszky <richard@kojedz.in>"

RUN \
    apk --no-cache add pgbouncer && \
    chown -R 6432:6432 /etc/pgbouncer

COPY assets/ /

USER 6432

ENV \
    CONFIG_SOURCE_FILES="pgbouncer.ini:/etc/pgbouncer/pgbouncer.ini userlist.txt:/etc/pgbouncer/userlist.txt" \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=postgres \
    POSTGRES_DB=postgres \
    POSTGRES_HOST=localhost \
    POSTGRES_PORT=5432 \
    PGBOUNCER_LISTEN_ADDR=127.0.0.1 \
    PGBOUNCER_LISTEN_PORT=6432 \
    PGBOUNCER_AUTH_TYPE=md5 \
    PGBOUNCER_POOL_MODE=session \
    PGBOUNCER_MAX_CLIENT_CONN=100 \
    PGBOUNCER_DEFAULT_POOL_SIZE=20 \
    PGBOUNCER_SERVER_LOGIN_RETRY=15

CMD ["/usr/bin/pgbouncer", "/etc/pgbouncer/pgbouncer.ini"]
