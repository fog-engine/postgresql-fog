#!/bin/bash

DATA_DIR=/data/postgres

if [ ! -f $DATA_DIR/PG_VERSION ]; then
  mkdir /data/postgres
  chown postgres:postgres $DATA_DIR
  chmod 0700 $DATA_DIR
  su postgres -c "echo $POSTGRESQL_PASSWORD > /tmp/pwfile && /usr/lib/postgresql/9.3/bin/initdb --encoding=UTF-8 -D $DATA_DIR -U $POSTGRESQL_USER --pwfile=/tmp/pwfile && rm /tmp/pwfile"
fi

su postgres -c "/usr/lib/postgresql/9.3/bin/postgres -c config_file=/etc/postgresql/9.3/main/postgresql.conf"
