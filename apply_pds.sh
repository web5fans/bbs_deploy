#!/bin/bash

envsubst < pds/sts.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < pds/ingress.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < pds/svc.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < pds/svc_node_port.yaml | kubectl -n $NAMESPACE apply -f -
