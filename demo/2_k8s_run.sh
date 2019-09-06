#!/bin/bash -v

kubectl run coffee-service --image=sbishyr/coffee-service:1.0 --port=8080 #--expose to create a service
