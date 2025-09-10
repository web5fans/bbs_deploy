#!/bin/bash

export PGPASSWORD='postgres' && psql -U postgres -h 127.0.0.1 -p $INDEXER_DB_NODE_PORT -d indexer -f indexer/init.sql
