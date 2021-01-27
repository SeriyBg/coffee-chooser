#!/bin/bash -v

kubectl set image deployments/coffee-service coffee-service=sbishyr/coffee-service:2.0;
kubectl rollout status deployments/coffee-service;

# clean up
# kubectl rollout undo deployments/coffee-service;
