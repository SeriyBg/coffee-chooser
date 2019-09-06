#!/bin/bash -v

export ISTIO_HOME="$(dirname ${ISTIO_PATH})";
kubectl create namespace istio-system
helm template ${ISTIO_HOME}/install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -
helm template ${ISTIO_HOME}/install/kubernetes/helm/istio --name istio --namespace istio-system \
    --values ${ISTIO_HOME}/install/kubernetes/helm/istio/values-istio-demo.yaml | kubectl apply -f -
# kubectl label namespace default istio-injection=enabled;
# kubectl -n istio-system get svc istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
