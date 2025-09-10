#!/bin/bash

envsubst < indexer/sts.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < indexer/ingress.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < indexer/svc.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < indexer/svc_node_port.yaml | kubectl -n $NAMESPACE apply -f -
