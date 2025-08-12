#!/bin/bash

kubectl --kubeconfig ~/.kube/bbs create secret tls web5 -n web5 --key key.pem --cert cert.pem