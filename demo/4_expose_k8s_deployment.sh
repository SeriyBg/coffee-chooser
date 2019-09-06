#!/bin/bash -v

kubectl expose deployment coffee-service --type=LoadBalancer --port=8080
