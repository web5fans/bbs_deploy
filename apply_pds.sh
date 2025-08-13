#!/bin/bash

source ./env.sh

envsubst < pds/sts.yaml | kubectl -n web5 apply -f -
envsubst < pds/ingress.yaml | kubectl -n web5 apply -f -
envsubst < pds/svc.yaml | kubectl -n web5 apply -f -
envsubst < pds/svc_node_port.yaml | kubectl -n web5 apply -f -
