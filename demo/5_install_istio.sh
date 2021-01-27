#!/bin/bash -v

istioctl install --set profile=demo;
kubectl label namespace default istio-injection=enabled --overwrite=true;
istioctl verify-install;

# istall telemetry addons
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/grafana.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/jaeger.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.8/samples/addons/kiali.yaml

# install application
kubectl apply -f $COFFEE_UI/coffee-ui.yaml;
kubectl apply -f $COFFEE_SERVICE/kubernetes/coffee-service.yaml;
kubectl apply -f $COFFEE_SERVICE/istio/gateway.yaml