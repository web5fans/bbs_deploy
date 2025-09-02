#!/bin/bash

export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p {$BBS_DB_PORT} -d bbs -f bbs/admin.sql
export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p {$BBS_DB_PORT} -d bbs -f bbs/data.sql
