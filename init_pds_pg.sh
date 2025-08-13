#!/bin/bash

export PGPASSWORD='password' && psql -U pg -h 127.0.0.1 -p 35432 -d postgres -f pds/init_up.sql
export PGPASSWORD='password' && psql -U pg -h 127.0.0.1 -p 35432 -d postgres -f pds/account_deactivation_up
