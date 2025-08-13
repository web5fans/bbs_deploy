#!/bin/bash

kubectl create secret tls web5 -n web5 --key /etc/letsencrypt/live/www.bbs.fans/privkey.pem --cert /etc/letsencrypt/live/www.bbs.fans/fullchain.pem
