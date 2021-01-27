#!/bin/bash -v

# inject error
kubectl apply -f $COFFEE_SERVICE/istio/fault-injection-error.yaml;

# inject delay
kubectl apply -f $COFFEE_SERVICE/istio/fault-injection-delay.yaml;

# clean up
# kubectl apply -f $COFFEE_SERVICE/istio/gateway.yaml;