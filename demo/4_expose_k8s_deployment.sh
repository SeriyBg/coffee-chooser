#!/bin/bash -v

kubectl expose deployment -n demo coffee-service --type=LoadBalancer --port=8080
