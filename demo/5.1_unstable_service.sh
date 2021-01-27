#!/bin/bash -v

# deploy unstable service
kubectl apply -f $COFFEE_SERVICE/kubernetes/service-unstable.yaml;

# istio retry
kubectl apply -f $COFFEE_SERVICE/istio/request-retry.yaml;

# clean up
# kubectl delete -f $COFFEE_SERVICE/kubernetes/service-unstable.yaml;
# kubectl apply -f $COFFEE_SERVICE/istio/gateway.yaml;