#!/bin/bash

envsubst < micro-pay/sts.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < micro-pay/ingress.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < micro-pay/svc.yaml | kubectl -n $NAMESPACE apply -f -
envsubst < micro-pay/svc_node_port.yaml | kubectl -n $NAMESPACE apply -f -
