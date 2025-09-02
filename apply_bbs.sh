#!/bin/bash

envsubst < bbs/sts.yaml | kubectl -n {$NAMESPACE} apply -f -
envsubst < bbs/ingress.yaml | kubectl -n {$NAMESPACE} apply -f -
envsubst < bbs/svc.yaml | kubectl -n {$NAMESPACE} apply -f -
envsubst < bbs/svc_node_port.yaml | kubectl -n {$NAMESPACE} apply -f -
