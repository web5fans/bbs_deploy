#!/bin/bash

source ./env.sh

envsubst < rsky/sts.yaml | kubectl -n web5 apply -f -
envsubst < rsky/ingress.yaml | kubectl -n web5 apply -f -
envsubst < rsky/svc.yaml | kubectl -n web5 apply -f -
envsubst < rsky/svc_node_port.yaml | kubectl -n web5 apply -f -

# export PGPASSWORD='password' && psql -U pg -h 127.0.0.1 -p 5433 -d postgres -f rsky/migrations/2023-11-15-004814_pds_init/up.sql
# export PGPASSWORD='password' && psql -U pg -h 127.0.0.1 -p 5433 -d postgres -f rsky/migrations/2024-03-20-042639_account_deactivation/up.sql
