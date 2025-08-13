#!/bin/bash

kubectl create secret tls web5 -n web5 --key key.pem --cert cert.pem
