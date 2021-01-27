#!/bin/bash -v

# deploy service v2
kubectl apply -f $COFFEE_SERVICE/kubernetes/service-v2.yaml

# create destination rules
kubectl apply -f $COFFEE_SERVICE/istio/destination-rule.yaml

# blue-green
## routing to v1
kubectl apply -f $COFFEE_SERVICE/istio/request-routing-all-v1.yaml
## routing to v2
kubectl apply -f $COFFEE_SERVICE/istio/request-routing-all-v2.yaml
## traffic mirroring
kubectl apply -f $COFFEE_SERVICE/istio/traffic-mirroring.yaml


# canary deployment
kubectl apply -f $COFFEE_SERVICE/istio/request-routing-chrome-v2.yaml

# clean up (release v2)
# kubectl apply -f $COFFEE_SERVICE/istio/request-routing-all-v2.yaml

