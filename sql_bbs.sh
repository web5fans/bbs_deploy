#!/bin/bash

export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p 32433 -d app -f bbs/admin.sql
export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p 32433 -d app -f bbs/data.sql
