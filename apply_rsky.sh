#!/bin/bash

source ./env.sh

envsubst < rsky/sts.yaml | kubectl -n web5 apply -f -
envsubst < rsky/ingress.yaml | kubectl -n web5 apply -f -
envsubst < rsky/svc.yaml | kubectl -n web5 apply -f -
envsubst < rsky/svc_node_port.yaml | kubectl -n web5 apply -f -
