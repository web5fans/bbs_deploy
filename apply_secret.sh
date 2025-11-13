#!/bin/bash

kubectl create secret tls web5 -n $NAMESPACE --key /etc/letsencrypt/live/res.bbsfans.dev/privkey.pem --cert /etc/letsencrypt/live/res.bbsfans.dev/fullchain.pem
