#!/bin/bash

kubectl create secret tls web5 -n {$NAMESPACE} --key /etc/letsencrypt/live/www.{$HOSTNAME}/privkey.pem --cert /etc/letsencrypt/live/www.{$HOSTNAME}/fullchain.pem

kubectl create secret tls res -n {$NAMESPACE} --key /etc/letsencrypt/live/{$RES_HOSTNAME}/privkey.pem --cert /etc/letsencrypt/live/{$RES_HOSTNAME}/fullchain.pem