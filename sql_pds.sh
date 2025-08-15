#!/bin/bash

export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p 32432 -d pds -f pds/init_up.sql
export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p 32432 -d pds -f pds/account_deactivation_up.sql
export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p 32432 -d pds -f pds/ckb.sql
