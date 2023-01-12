# pgbouncer

Rootless pgbouncer. Configuration through environment variables allow for setting up Pgbouncer to handle just one database with just one user account. Environment variables:

Environment variable | meaning | default value
-|-|-
POSTGRES_USER | Username for authentication for clients | postgres
POSTGRES_PASSWORD | Password for username | postgres
POSTGRES_DB | Database name | postgres
POSTGRES_HOST | Hostname of backend postgres | localhost
POSTGRES_PORT | Port of backend postgres | 5432
PGBOUNCER_LISTEN_ADDR | Listen address for Pgbouncer | 127.0.0.1
PGBOUNCER_LISTEN_PORT | Listen port for Pgbouncer | 6432
PGBOUNCER_AUTH_TYPE | How to authenticate users | md5
PGBOUNCER_POOL_MODE | Default pool mode of pgbouncer | session
PGBOUNCER_MAX_CLIENT_CONN | Maximum number of client connections allowed | 100
PGBOUNCER_DEFAULT_POOL_SIZE | How many server connections to allow per user/database pair | 20

These variables simply get replaced into generated pgbouncer.ini and userlist.txt. If more complex configuration is needed, mount the desired configuration and invoke the image with explicit entrypoint:

```bash
$ docker run -e pgbouncer ghcr.io/kubernetize/pgbouncer /path/to/pgbouncer.ini
```

This is intended to run as a side-container for specific applications in Kubernetes, thus Pgbouncer is bound to 127.0.0.1 by default (__PGBOUNCER_LISTEN_ADDR__).