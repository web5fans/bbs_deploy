#!/bin/bash

kubectl create secret tls web5 -n $NAMESPACE --key /etc/letsencrypt/live/$HOSTNAME/privkey.pem --cert /etc/letsencrypt/live/$HOSTNAME/fullchain.pem
