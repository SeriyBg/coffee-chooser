#!/bin/bash -v

# deploy slow service
kubectl apply -f $COFFEE_SERVICE/kubernetes/service-delay.yaml;

# istio retry
kubectl apply -f $COFFEE_SERVICE/istio/request-timeout.yaml;

# clean up
# kubectl delete -f $COFFEE_SERVICE/kubernetes/service-delay.yaml;
# kubectl apply -f $COFFEE_SERVICE/istio/gateway.yaml;